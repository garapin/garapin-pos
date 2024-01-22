part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
    User? user,
  }) = _ProfileState;
}
