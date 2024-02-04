part of 'select_database_cubit.dart';

@freezed
class SelectDatabaseState with _$SelectDatabaseState {
  const factory SelectDatabaseState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
    User? user,
    @Default('') String selectedDatabase,
  }) = _SelectDatabaseState;
}
