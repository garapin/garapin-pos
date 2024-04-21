part of 'master_report_cubit.dart';

@freezed
class MasterReportState with _$MasterReportState {
  const factory MasterReportState({
    Store? store,
    @Default(true) bool showPage,
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default(0) int index,
    @Default(SizedBox()) Widget widget,
    @Default(true) bool isInitialMaster,
  }) = _MasterReportState;
}
