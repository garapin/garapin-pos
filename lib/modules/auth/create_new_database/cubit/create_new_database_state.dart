part of 'create_new_database_cubit.dart';

@freezed
class CreateNewDatabaseState with _$CreateNewDatabaseState {
  const factory CreateNewDatabaseState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
  }) = _CreateNewDatabaseState;
}
