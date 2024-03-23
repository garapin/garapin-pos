// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_bagi_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateBagiState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  Store? get store => throw _privateConstructorUsedError;
  RoutePayments? get routePayments => throw _privateConstructorUsedError;
  List<DatabaseStore> get merchants => throw _privateConstructorUsedError;
  SplitPaymentTemplate? get paymentTemplate =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateBagiStateCopyWith<CreateBagiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBagiStateCopyWith<$Res> {
  factory $CreateBagiStateCopyWith(
          CreateBagiState value, $Res Function(CreateBagiState) then) =
      _$CreateBagiStateCopyWithImpl<$Res, CreateBagiState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      Store? store,
      RoutePayments? routePayments,
      List<DatabaseStore> merchants,
      SplitPaymentTemplate? paymentTemplate});
}

/// @nodoc
class _$CreateBagiStateCopyWithImpl<$Res, $Val extends CreateBagiState>
    implements $CreateBagiStateCopyWith<$Res> {
  _$CreateBagiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? store = freezed,
    Object? routePayments = freezed,
    Object? merchants = null,
    Object? paymentTemplate = freezed,
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
      routePayments: freezed == routePayments
          ? _value.routePayments
          : routePayments // ignore: cast_nullable_to_non_nullable
              as RoutePayments?,
      merchants: null == merchants
          ? _value.merchants
          : merchants // ignore: cast_nullable_to_non_nullable
              as List<DatabaseStore>,
      paymentTemplate: freezed == paymentTemplate
          ? _value.paymentTemplate
          : paymentTemplate // ignore: cast_nullable_to_non_nullable
              as SplitPaymentTemplate?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateBagiStateImplCopyWith<$Res>
    implements $CreateBagiStateCopyWith<$Res> {
  factory _$$CreateBagiStateImplCopyWith(_$CreateBagiStateImpl value,
          $Res Function(_$CreateBagiStateImpl) then) =
      __$$CreateBagiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      Store? store,
      RoutePayments? routePayments,
      List<DatabaseStore> merchants,
      SplitPaymentTemplate? paymentTemplate});
}

/// @nodoc
class __$$CreateBagiStateImplCopyWithImpl<$Res>
    extends _$CreateBagiStateCopyWithImpl<$Res, _$CreateBagiStateImpl>
    implements _$$CreateBagiStateImplCopyWith<$Res> {
  __$$CreateBagiStateImplCopyWithImpl(
      _$CreateBagiStateImpl _value, $Res Function(_$CreateBagiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? store = freezed,
    Object? routePayments = freezed,
    Object? merchants = null,
    Object? paymentTemplate = freezed,
  }) {
    return _then(_$CreateBagiStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      routePayments: freezed == routePayments
          ? _value.routePayments
          : routePayments // ignore: cast_nullable_to_non_nullable
              as RoutePayments?,
      merchants: null == merchants
          ? _value._merchants
          : merchants // ignore: cast_nullable_to_non_nullable
              as List<DatabaseStore>,
      paymentTemplate: freezed == paymentTemplate
          ? _value.paymentTemplate
          : paymentTemplate // ignore: cast_nullable_to_non_nullable
              as SplitPaymentTemplate?,
    ));
  }
}

/// @nodoc

class _$CreateBagiStateImpl implements _CreateBagiState {
  const _$CreateBagiStateImpl(
      {this.status = DataStateStatus.initial,
      this.store,
      this.routePayments,
      final List<DatabaseStore> merchants = const [],
      this.paymentTemplate})
      : _merchants = merchants;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final Store? store;
  @override
  final RoutePayments? routePayments;
  final List<DatabaseStore> _merchants;
  @override
  @JsonKey()
  List<DatabaseStore> get merchants {
    if (_merchants is EqualUnmodifiableListView) return _merchants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_merchants);
  }

  @override
  final SplitPaymentTemplate? paymentTemplate;

  @override
  String toString() {
    return 'CreateBagiState(status: $status, store: $store, routePayments: $routePayments, merchants: $merchants, paymentTemplate: $paymentTemplate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBagiStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.routePayments, routePayments) ||
                other.routePayments == routePayments) &&
            const DeepCollectionEquality()
                .equals(other._merchants, _merchants) &&
            (identical(other.paymentTemplate, paymentTemplate) ||
                other.paymentTemplate == paymentTemplate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, store, routePayments,
      const DeepCollectionEquality().hash(_merchants), paymentTemplate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBagiStateImplCopyWith<_$CreateBagiStateImpl> get copyWith =>
      __$$CreateBagiStateImplCopyWithImpl<_$CreateBagiStateImpl>(
          this, _$identity);
}

abstract class _CreateBagiState implements CreateBagiState {
  const factory _CreateBagiState(
      {final DataStateStatus status,
      final Store? store,
      final RoutePayments? routePayments,
      final List<DatabaseStore> merchants,
      final SplitPaymentTemplate? paymentTemplate}) = _$CreateBagiStateImpl;

  @override
  DataStateStatus get status;
  @override
  Store? get store;
  @override
  RoutePayments? get routePayments;
  @override
  List<DatabaseStore> get merchants;
  @override
  SplitPaymentTemplate? get paymentTemplate;
  @override
  @JsonKey(ignore: true)
  _$$CreateBagiStateImplCopyWith<_$CreateBagiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
