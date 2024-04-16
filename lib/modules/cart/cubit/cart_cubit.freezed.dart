// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  Cart? get cart => throw _privateConstructorUsedError;
  String? get invoces => throw _privateConstructorUsedError;
  bool get isCheckout => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      Cart? cart,
      String? invoces,
      bool isCheckout,
      String? err});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cart = freezed,
    Object? invoces = freezed,
    Object? isCheckout = null,
    Object? err = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      cart: freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart?,
      invoces: freezed == invoces
          ? _value.invoces
          : invoces // ignore: cast_nullable_to_non_nullable
              as String?,
      isCheckout: null == isCheckout
          ? _value.isCheckout
          : isCheckout // ignore: cast_nullable_to_non_nullable
              as bool,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
          _$CartStateImpl value, $Res Function(_$CartStateImpl) then) =
      __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      Cart? cart,
      String? invoces,
      bool isCheckout,
      String? err});
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
      _$CartStateImpl _value, $Res Function(_$CartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cart = freezed,
    Object? invoces = freezed,
    Object? isCheckout = null,
    Object? err = freezed,
  }) {
    return _then(_$CartStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      cart: freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart?,
      invoces: freezed == invoces
          ? _value.invoces
          : invoces // ignore: cast_nullable_to_non_nullable
              as String?,
      isCheckout: null == isCheckout
          ? _value.isCheckout
          : isCheckout // ignore: cast_nullable_to_non_nullable
              as bool,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CartStateImpl implements _CartState {
  const _$CartStateImpl(
      {this.status = DataStateStatus.initial,
      this.cart,
      this.invoces,
      this.isCheckout = false,
      this.err});

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final Cart? cart;
  @override
  final String? invoces;
  @override
  @JsonKey()
  final bool isCheckout;
  @override
  final String? err;

  @override
  String toString() {
    return 'CartState(status: $status, cart: $cart, invoces: $invoces, isCheckout: $isCheckout, err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cart, cart) || other.cart == cart) &&
            (identical(other.invoces, invoces) || other.invoces == invoces) &&
            (identical(other.isCheckout, isCheckout) ||
                other.isCheckout == isCheckout) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, cart, invoces, isCheckout, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState implements CartState {
  const factory _CartState(
      {final DataStateStatus status,
      final Cart? cart,
      final String? invoces,
      final bool isCheckout,
      final String? err}) = _$CartStateImpl;

  @override
  DataStateStatus get status;
  @override
  Cart? get cart;
  @override
  String? get invoces;
  @override
  bool get isCheckout;
  @override
  String? get err;
  @override
  @JsonKey(ignore: true)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
