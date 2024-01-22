part of 'add_user_cubit.dart';

@freezed
class AddUserState with _$AddUserState {
  const factory AddUserState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
  }) = _AddUserState;
}
