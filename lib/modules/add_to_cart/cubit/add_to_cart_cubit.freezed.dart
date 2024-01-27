// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_to_cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddToCartState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get noProduct => throw _privateConstructorUsedError;
  String? get imei => throw _privateConstructorUsedError;
  String? get noSn => throw _privateConstructorUsedError;
  TypeScan get typeScan => throw _privateConstructorUsedError;
  RulesScan? get rulesScan => throw _privateConstructorUsedError;
  List<Cart> get cart => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddToCartStateCopyWith<AddToCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToCartStateCopyWith<$Res> {
  factory $AddToCartStateCopyWith(
          AddToCartState value, $Res Function(AddToCartState) then) =
      _$AddToCartStateCopyWithImpl<$Res, AddToCartState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      String? error,
      String? noProduct,
      String? imei,
      String? noSn,
      TypeScan typeScan,
      RulesScan? rulesScan,
      List<Cart> cart});
}

/// @nodoc
class _$AddToCartStateCopyWithImpl<$Res, $Val extends AddToCartState>
    implements $AddToCartStateCopyWith<$Res> {
  _$AddToCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? noProduct = freezed,
    Object? imei = freezed,
    Object? noSn = freezed,
    Object? typeScan = null,
    Object? rulesScan = freezed,
    Object? cart = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      noProduct: freezed == noProduct
          ? _value.noProduct
          : noProduct // ignore: cast_nullable_to_non_nullable
              as String?,
      imei: freezed == imei
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as String?,
      noSn: freezed == noSn
          ? _value.noSn
          : noSn // ignore: cast_nullable_to_non_nullable
              as String?,
      typeScan: null == typeScan
          ? _value.typeScan
          : typeScan // ignore: cast_nullable_to_non_nullable
              as TypeScan,
      rulesScan: freezed == rulesScan
          ? _value.rulesScan
          : rulesScan // ignore: cast_nullable_to_non_nullable
              as RulesScan?,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<Cart>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddToCartStateImplCopyWith<$Res>
    implements $AddToCartStateCopyWith<$Res> {
  factory _$$AddToCartStateImplCopyWith(_$AddToCartStateImpl value,
          $Res Function(_$AddToCartStateImpl) then) =
      __$$AddToCartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      String? error,
      String? noProduct,
      String? imei,
      String? noSn,
      TypeScan typeScan,
      RulesScan? rulesScan,
      List<Cart> cart});
}

/// @nodoc
class __$$AddToCartStateImplCopyWithImpl<$Res>
    extends _$AddToCartStateCopyWithImpl<$Res, _$AddToCartStateImpl>
    implements _$$AddToCartStateImplCopyWith<$Res> {
  __$$AddToCartStateImplCopyWithImpl(
      _$AddToCartStateImpl _value, $Res Function(_$AddToCartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? noProduct = freezed,
    Object? imei = freezed,
    Object? noSn = freezed,
    Object? typeScan = null,
    Object? rulesScan = freezed,
    Object? cart = null,
  }) {
    return _then(_$AddToCartStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      noProduct: freezed == noProduct
          ? _value.noProduct
          : noProduct // ignore: cast_nullable_to_non_nullable
              as String?,
      imei: freezed == imei
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as String?,
      noSn: freezed == noSn
          ? _value.noSn
          : noSn // ignore: cast_nullable_to_non_nullable
              as String?,
      typeScan: null == typeScan
          ? _value.typeScan
          : typeScan // ignore: cast_nullable_to_non_nullable
              as TypeScan,
      rulesScan: freezed == rulesScan
          ? _value.rulesScan
          : rulesScan // ignore: cast_nullable_to_non_nullable
              as RulesScan?,
      cart: null == cart
          ? _value._cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<Cart>,
    ));
  }
}

/// @nodoc

class _$AddToCartStateImpl implements _AddToCartState {
  const _$AddToCartStateImpl(
      {this.status = DataStateStatus.initial,
      this.error,
      this.noProduct,
      this.imei,
      this.noSn,
      this.typeScan = TypeScan.noProduct,
      this.rulesScan,
      final List<Cart> cart = const []})
      : _cart = cart;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? error;
  @override
  final String? noProduct;
  @override
  final String? imei;
  @override
  final String? noSn;
  @override
  @JsonKey()
  final TypeScan typeScan;
  @override
  final RulesScan? rulesScan;
  final List<Cart> _cart;
  @override
  @JsonKey()
  List<Cart> get cart {
    if (_cart is EqualUnmodifiableListView) return _cart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cart);
  }

  @override
  String toString() {
    return 'AddToCartState(status: $status, error: $error, noProduct: $noProduct, imei: $imei, noSn: $noSn, typeScan: $typeScan, rulesScan: $rulesScan, cart: $cart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToCartStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.noProduct, noProduct) ||
                other.noProduct == noProduct) &&
            (identical(other.imei, imei) || other.imei == imei) &&
            (identical(other.noSn, noSn) || other.noSn == noSn) &&
            (identical(other.typeScan, typeScan) ||
                other.typeScan == typeScan) &&
            (identical(other.rulesScan, rulesScan) ||
                other.rulesScan == rulesScan) &&
            const DeepCollectionEquality().equals(other._cart, _cart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, noProduct, imei,
      noSn, typeScan, rulesScan, const DeepCollectionEquality().hash(_cart));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToCartStateImplCopyWith<_$AddToCartStateImpl> get copyWith =>
      __$$AddToCartStateImplCopyWithImpl<_$AddToCartStateImpl>(
          this, _$identity);
}

abstract class _AddToCartState implements AddToCartState {
  const factory _AddToCartState(
      {final DataStateStatus status,
      final String? error,
      final String? noProduct,
      final String? imei,
      final String? noSn,
      final TypeScan typeScan,
      final RulesScan? rulesScan,
      final List<Cart> cart}) = _$AddToCartStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get error;
  @override
  String? get noProduct;
  @override
  String? get imei;
  @override
  String? get noSn;
  @override
  TypeScan get typeScan;
  @override
  RulesScan? get rulesScan;
  @override
  List<Cart> get cart;
  @override
  @JsonKey(ignore: true)
  _$$AddToCartStateImplCopyWith<_$AddToCartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
