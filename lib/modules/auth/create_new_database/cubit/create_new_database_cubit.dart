import 'package:armory/data/api/services.dart';
import 'package:armory/engine/engine.dart';
import 'package:armory/engine/helpers/options.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

part 'create_new_database_state.dart';
part 'create_new_database_cubit.freezed.dart';

class CreateNewDatabaseCubit extends BaseCubit<CreateNewDatabaseState> {
  final TextEditingController databaseNameControler = TextEditingController();
  CreateNewDatabaseCubit(BuildContext context)
      : super(context, const CreateNewDatabaseState());

  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(status: DataStateStatus.success));
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));
  @override
  Future<void> refreshData() => initData();

  void doCretaeNewDatabase() async {
    loadingState();
    final data = await ApiService.createDatabase(context,
        databaseName: databaseNameControler.text);
    if (data.isSuccess) {
      showSuccess(data.message);
      context.pop();
    } else {
      showError(data.message);
    }
    finishRefresh(state.status);
  }
}
