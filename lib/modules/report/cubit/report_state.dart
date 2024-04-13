part of 'report_cubit.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState(
      {@Default(DataStateStatus.initial) DataStateStatus status,
      @Default([]) List<Datum> transaction,
      @Default([]) List<FilterStoreTransaction> filterTemplate,
      String? param,
      String? startDate,
      String? endDate,
      String? targetDatabase,
      Store? store,
      @Default(false) bool canLoadMore,
      String? err}) = _ReportState;
}
