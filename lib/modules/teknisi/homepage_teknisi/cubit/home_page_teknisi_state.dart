part of 'home_page_teknisi_cubit.dart';

@freezed
class HomePageTeknisiState with _$HomePageTeknisiState {
  const factory HomePageTeknisiState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
    @Default("ALL") String filterStatus,
    @Default([]) List<Transaction> listTransaction,
  }) = _HomePageTeknisiState;
}
