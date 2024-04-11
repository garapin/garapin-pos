part of 'report_detail_cubit.dart';

@freezed
class ReportDetailState with _$ReportDetailState {
  const factory ReportDetailState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    SplitPaymentDetail? split,
    String? err,
  }) = _ReportDetailState;
}
