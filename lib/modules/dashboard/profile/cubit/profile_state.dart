part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    Store? store,
    String? err,
    XFile? pickedImage,
    String? country,
    String? stateAddress,
    String? city,
  }) = _ProfileState;
}
