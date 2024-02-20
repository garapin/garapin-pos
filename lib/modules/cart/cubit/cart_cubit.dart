import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/cart.dart';
import 'package:pos/engine/engine.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends BaseCubit<CartState> {
  final TextEditingController quantityController = TextEditingController();
  CartCubit(BuildContext context) : super(context, CartState());

  @override
  Future<void> initData({bool force = true}) async {
    loadingState(force: force);
    final cart =
        await ApiService.getCart(context, idUser: Sessions.getUserModel()!.id!);
    if (cart.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, cart: cart.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error, err: cart.message));
    }
  }

  @override
  void loadingState({bool force = true}) {
    emit(state.copyWith(
        status: force ? DataStateStatus.initial : DataStateStatus.loading));
  }

  @override
  Future<void> refreshData() => initData(force: false);

  void addToCart({required String idProduct}) async {
    final data =
        await ApiService.addToCart(context, idProduct: idProduct, quantity: 1);
    if (data.isSuccess) {
      refreshData();
    } else {
      showError(data.message);
    }
  }

  setQuantity(
      {required String idProduct,
      required int quantity,
      required int newQuantity}) async {
    final data = await ApiService.addToCart(context,
        idProduct: idProduct, quantity: -quantity + newQuantity);
    if (data.isSuccess) {
      refreshData();
    } else {
      showError(data.message);
    }
    context.pop();
  }

  void removeFromCart({required String idProduct, int qty = -1}) async {
    final data = await ApiService.addToCart(context,
        idProduct: idProduct, quantity: qty);
    if (data.isSuccess) {
      refreshData();
    } else {
      showError(data.message);
    }
  }
}
