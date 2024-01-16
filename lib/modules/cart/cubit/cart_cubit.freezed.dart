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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;
  List<Cart> get cart => throw _privateConstructorUsedError;
  List<String> get selectedItem => throw _privateConstructorUsedError;

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
      String? err,
      List<Cart> cart,
      List<String> selectedItem});
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
    Object? err = freezed,
    Object? cart = null,
    Object? selectedItem = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<Cart>,
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      String? err,
      List<Cart> cart,
      List<String> selectedItem});
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
    Object? err = freezed,
    Object? cart = null,
    Object? selectedItem = null,
  }) {
    return _then(_$CartStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      cart: null == cart
          ? _value._cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<Cart>,
      selectedItem: null == selectedItem
          ? _value._selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$CartStateImpl implements _CartState {
  const _$CartStateImpl(
      {this.status = DataStateStatus.initial,
      this.err,
      final List<Cart> cart = const [],
      final List<String> selectedItem = const []})
      : _cart = cart,
        _selectedItem = selectedItem;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? err;
  final List<Cart> _cart;
  @override
  @JsonKey()
  List<Cart> get cart {
    if (_cart is EqualUnmodifiableListView) return _cart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cart);
  }

  final List<String> _selectedItem;
  @override
  @JsonKey()
  List<String> get selectedItem {
    if (_selectedItem is EqualUnmodifiableListView) return _selectedItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedItem);
  }

  @override
  String toString() {
    return 'CartState(status: $status, err: $err, cart: $cart, selectedItem: $selectedItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.err, err) || other.err == err) &&
            const DeepCollectionEquality().equals(other._cart, _cart) &&
            const DeepCollectionEquality()
                .equals(other._selectedItem, _selectedItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      err,
      const DeepCollectionEquality().hash(_cart),
      const DeepCollectionEquality().hash(_selectedItem));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState implements CartState {
  const factory _CartState(
      {final DataStateStatus status,
      final String? err,
      final List<Cart> cart,
      final List<String> selectedItem}) = _$CartStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get err;
  @override
  List<Cart> get cart;
  @override
  List<String> get selectedItem;
  @override
  @JsonKey(ignore: true)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
