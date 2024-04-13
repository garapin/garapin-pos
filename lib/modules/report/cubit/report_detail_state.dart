part of 'report_detail_cubit.dart';

@freezed
class ReportDetailState with _$ReportDetailState {
  const factory ReportDetailState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    SplitPaymentDetail? split,
    Invoices? invoice,
    Store? store,
    String? err,
  }) = _ReportDetailState;
}
