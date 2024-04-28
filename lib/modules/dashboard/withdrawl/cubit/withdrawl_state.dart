part of 'withdrawl_cubit.dart';

@freezed
class WithdrawlState with _$WithdrawlState {
  const factory WithdrawlState({
    @Default(false) bool isPinMatch,
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
    AccountBalance? accountBalance,
    @Default([]) List<WithdrawHistory> history,
    @Default([]) List<AvailablePayment> availablePayment,
    CheckAmountWithdraw? checkAmountWithdraw,
    String? startDate,
    String? endDate,
  }) = _WithdrawlState;
}
