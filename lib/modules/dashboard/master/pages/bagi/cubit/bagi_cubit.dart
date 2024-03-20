import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/engine/engine.dart';

part 'bagi_state.dart';
part 'bagi_cubit.freezed.dart';

class BagiCubit extends BaseCubit<BagiState> {
  BagiCubit(BuildContext context) : super(context, BagiState());

  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(status: state.status));
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();
}
