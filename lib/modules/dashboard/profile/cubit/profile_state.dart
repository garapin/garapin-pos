part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    Store? store,
    String? err,
    XFile? pickedImage,
    XFile? npwpImage,
    XFile? nibImage,
    XFile? aktaImage,
    String? country,
    String? stateAddress,
    String? city,
    String? currentVersion,
    @Default(false) bool showFormBussinessPartner,
    @Default([]) List<AvailablePayment> availablePayment,
  }) = _ProfileState;
}
