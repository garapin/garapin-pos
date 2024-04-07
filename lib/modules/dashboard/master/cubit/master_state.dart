part of 'master_cubit.dart';

@freezed
class MasterState with _$MasterState {
  const factory MasterState({
    Store? store,
    @Default(true) bool showPage,
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default(0) int index,
    @Default(SizedBox()) Widget widget,
    @Default(true) bool isInitialMaster,
  }) = _MasterState;
}
