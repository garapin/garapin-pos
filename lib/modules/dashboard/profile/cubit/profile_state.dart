part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    Store? store,
    String? err,
  }) = _ProfileState;
}
