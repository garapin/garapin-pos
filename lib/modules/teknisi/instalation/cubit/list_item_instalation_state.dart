part of 'list_item_instalation_cubit.dart';

@freezed
class ListItemInstalationState with _$ListItemInstalationState {
  const factory ListItemInstalationState(
      {@Default(DataStateStatus.initial) DataStateStatus status,
      @Default([]) List<TransactionItem> item,
      @Default([]) List<TransactionItem> selectedItem,
      String? err}) = _ListItemInstalationState;
}
