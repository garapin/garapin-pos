part of 'master_cubit.dart';

@freezed
class MasterState with _$MasterState {
  const factory MasterState({
    @Default(true) bool showPage,
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default(0) int index,
    @Default(CatalogPage(
      modeCatalog: ModeCatalog.edit,
    ))
    Widget widget,
  }) = _MasterState;
}
