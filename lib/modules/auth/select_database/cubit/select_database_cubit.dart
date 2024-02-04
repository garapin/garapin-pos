import 'package:armory/data/api/services.dart';
import 'package:armory/data/models/base/user.dart';
import 'package:armory/engine/engine.dart';
import 'package:armory/engine/helpers/options.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_database_state.dart';
part 'select_database_cubit.freezed.dart';

class SelectDatabaseCubit extends BaseCubit<SelectDatabaseState> {
  SelectDatabaseCubit(BuildContext context)
      : super(context, SelectDatabaseState());

  @override
  Future<void> initData() async {
    loadingState();
    final data = await ApiService.signinWithGoogle(context,
        email: "safikmohamad14@gmail.com");
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, user: data.data));
    } else {
      emit(state.copyWith(
          status: DataStateStatus.error, user: data.data, err: data.message));
    }
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.success));

  @override
  Future<void> refreshData() => initData();

  selectedDatabase(String databaseName) {
    emit(state.copyWith(selectedDatabase: databaseName));
  }
}
