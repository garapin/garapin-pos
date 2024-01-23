part of 'process_instalation_item_cubit.dart';

@freezed
class ProcessInstalationItemState with _$ProcessInstalationItemState {
  const factory ProcessInstalationItemState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
    @Default([]) List<TransactionItem> item,
    @Default([]) List<XFile> pickedImage,
    @Default([]) List<String> listBase64,
  }) = _ProcessInstalationItemState;
}
