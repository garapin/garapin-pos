// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_merchant_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyMerchantState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  Store? get store => throw _privateConstructorUsedError;
  List<DatabaseStore> get merchants => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyMerchantStateCopyWith<MyMerchantState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyMerchantStateCopyWith<$Res> {
  factory $MyMerchantStateCopyWith(
          MyMerchantState value, $Res Function(MyMerchantState) then) =
      _$MyMerchantStateCopyWithImpl<$Res, MyMerchantState>;
  @useResult
  $Res call(
      {DataStateStatus status, Store? store, List<DatabaseStore> merchants});
}

/// @nodoc
class _$MyMerchantStateCopyWithImpl<$Res, $Val extends MyMerchantState>
    implements $MyMerchantStateCopyWith<$Res> {
  _$MyMerchantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? store = freezed,
    Object? merchants = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      merchants: null == merchants
          ? _value.merchants
          : merchants // ignore: cast_nullable_to_non_nullable
              as List<DatabaseStore>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyMerchantStateImplCopyWith<$Res>
    implements $MyMerchantStateCopyWith<$Res> {
  factory _$$MyMerchantStateImplCopyWith(_$MyMerchantStateImpl value,
          $Res Function(_$MyMerchantStateImpl) then) =
      __$$MyMerchantStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status, Store? store, List<DatabaseStore> merchants});
}

/// @nodoc
class __$$MyMerchantStateImplCopyWithImpl<$Res>
    extends _$MyMerchantStateCopyWithImpl<$Res, _$MyMerchantStateImpl>
    implements _$$MyMerchantStateImplCopyWith<$Res> {
  __$$MyMerchantStateImplCopyWithImpl(
      _$MyMerchantStateImpl _value, $Res Function(_$MyMerchantStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? store = freezed,
    Object? merchants = null,
  }) {
    return _then(_$MyMerchantStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      merchants: null == merchants
          ? _value._merchants
          : merchants // ignore: cast_nullable_to_non_nullable
              as List<DatabaseStore>,
    ));
  }
}

/// @nodoc

class _$MyMerchantStateImpl implements _MyMerchantState {
  const _$MyMerchantStateImpl(
      {this.status = DataStateStatus.initial,
      this.store,
      final List<DatabaseStore> merchants = const []})
      : _merchants = merchants;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final Store? store;
  final List<DatabaseStore> _merchants;
  @override
  @JsonKey()
  List<DatabaseStore> get merchants {
    if (_merchants is EqualUnmodifiableListView) return _merchants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_merchants);
  }

  @override
  String toString() {
    return 'MyMerchantState(status: $status, store: $store, merchants: $merchants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyMerchantStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.store, store) || other.store == store) &&
            const DeepCollectionEquality()
                .equals(other._merchants, _merchants));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, store,
      const DeepCollectionEquality().hash(_merchants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyMerchantStateImplCopyWith<_$MyMerchantStateImpl> get copyWith =>
      __$$MyMerchantStateImplCopyWithImpl<_$MyMerchantStateImpl>(
          this, _$identity);
}

abstract class _MyMerchantState implements MyMerchantState {
  const factory _MyMerchantState(
      {final DataStateStatus status,
      final Store? store,
      final List<DatabaseStore> merchants}) = _$MyMerchantStateImpl;

  @override
  DataStateStatus get status;
  @override
  Store? get store;
  @override
  List<DatabaseStore> get merchants;
  @override
  @JsonKey(ignore: true)
  _$$MyMerchantStateImplCopyWith<_$MyMerchantStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
