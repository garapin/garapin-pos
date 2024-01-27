part of 'homepage_cubit.dart';

@freezed
class HomepageState with _$HomepageState {
  const factory HomepageState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
    @Default([]) List<Transaction> listTransaction,
    @Default("ALL") String filterStatus,
  }) = _HomepageState;
}
