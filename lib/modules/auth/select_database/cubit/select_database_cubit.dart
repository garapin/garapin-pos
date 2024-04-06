import 'dart:convert';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/database_store.dart';
import 'package:pos/data/models/base/user.dart';
import 'package:pos/engine/engine.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/routes.dart';

part 'select_database_state.dart';
part 'select_database_cubit.freezed.dart';

class SelectDatabaseCubit extends BaseCubit<SelectDatabaseState> {
  SelectDatabaseCubit(BuildContext context)
      : super(context, SelectDatabaseState());

  @override
  Future<void> initData() async {
    loadingState();
    final data = await ApiService.signinWithGoogle(context,
        email: Sessions.getUserModel()!.email!);
    if (data.isSuccess) {
      if (data.data!.database!.isNotEmpty) {
        String firstSelected = data.data?.database?.first.dbName ?? "";
        emit(state.copyWith(
            status: DataStateStatus.success,
            databaseStore: data.data!.database!,
            selectedDatabase: firstSelected));
      } else {
        emit(state.copyWith(
          status: DataStateStatus.success,
          databaseStore: data.data!.database!,
        ));
      }
    } else {
      emit(state.copyWith(
          status: DataStateStatus.error,
          databaseStore: data.data!.database!,
          err: data.message));
    }
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  selectedDatabase(String databaseName) {
    emit(state.copyWith(selectedDatabase: databaseName));
  }

  doSelecteDatabase(User userDatabase) {
    if (state.selectedDatabase == "") {
      showError("Belum memilih database");
    } else {
      Sessions.setIsLogin("Y");
      Sessions.setDatabase(jsonEncode(userDatabase.storeDatabaseName
              ?.where(
                  (e) => e.name.toString() == state.selectedDatabase.toString())
              .first))
          .then((value) async {
        final data = await ApiService.getStoreInfo(context);
        if (data.isSuccess) {
          Sessions.setAccountHolder(
              jsonEncode(data.data!.store!.accountHolder));
          (data.data?.store?.storeName == null)
              ? context.pushNamed(RouteNames.profile)
              : context.go(RouteNames.dashboard);
        }
      });
    }
  }
}
