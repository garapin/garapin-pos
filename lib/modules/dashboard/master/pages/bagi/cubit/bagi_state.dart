part of 'bagi_cubit.dart';

@freezed
class BagiState with _$BagiState {
  const factory BagiState({
    @Default(DataStateStatus.initial) DataStateStatus status,
  }) = _BagiState;
}
