// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bagi_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BagiState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  Store? get store => throw _privateConstructorUsedError;
  List<SplitPaymentTemplate> get paymentTemplate =>
      throw _privateConstructorUsedError;
  List<RoutePayments>? get routePayment => throw _privateConstructorUsedError;
  List<DatabaseStore> get merchants => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  BagiView get bagiView => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BagiStateCopyWith<BagiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BagiStateCopyWith<$Res> {
  factory $BagiStateCopyWith(BagiState value, $Res Function(BagiState) then) =
      _$BagiStateCopyWithImpl<$Res, BagiState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      Store? store,
      List<SplitPaymentTemplate> paymentTemplate,
      List<RoutePayments>? routePayment,
      List<DatabaseStore> merchants,
      String? id,
      BagiView bagiView});
}

/// @nodoc
class _$BagiStateCopyWithImpl<$Res, $Val extends BagiState>
    implements $BagiStateCopyWith<$Res> {
  _$BagiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? store = freezed,
    Object? paymentTemplate = null,
    Object? routePayment = freezed,
    Object? merchants = null,
    Object? id = freezed,
    Object? bagiView = null,
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
      paymentTemplate: null == paymentTemplate
          ? _value.paymentTemplate
          : paymentTemplate // ignore: cast_nullable_to_non_nullable
              as List<SplitPaymentTemplate>,
      routePayment: freezed == routePayment
          ? _value.routePayment
          : routePayment // ignore: cast_nullable_to_non_nullable
              as List<RoutePayments>?,
      merchants: null == merchants
          ? _value.merchants
          : merchants // ignore: cast_nullable_to_non_nullable
              as List<DatabaseStore>,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bagiView: null == bagiView
          ? _value.bagiView
          : bagiView // ignore: cast_nullable_to_non_nullable
              as BagiView,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BagiStateImplCopyWith<$Res>
    implements $BagiStateCopyWith<$Res> {
  factory _$$BagiStateImplCopyWith(
          _$BagiStateImpl value, $Res Function(_$BagiStateImpl) then) =
      __$$BagiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      Store? store,
      List<SplitPaymentTemplate> paymentTemplate,
      List<RoutePayments>? routePayment,
      List<DatabaseStore> merchants,
      String? id,
      BagiView bagiView});
}

/// @nodoc
class __$$BagiStateImplCopyWithImpl<$Res>
    extends _$BagiStateCopyWithImpl<$Res, _$BagiStateImpl>
    implements _$$BagiStateImplCopyWith<$Res> {
  __$$BagiStateImplCopyWithImpl(
      _$BagiStateImpl _value, $Res Function(_$BagiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? store = freezed,
    Object? paymentTemplate = null,
    Object? routePayment = freezed,
    Object? merchants = null,
    Object? id = freezed,
    Object? bagiView = null,
  }) {
    return _then(_$BagiStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      paymentTemplate: null == paymentTemplate
          ? _value._paymentTemplate
          : paymentTemplate // ignore: cast_nullable_to_non_nullable
              as List<SplitPaymentTemplate>,
      routePayment: freezed == routePayment
          ? _value._routePayment
          : routePayment // ignore: cast_nullable_to_non_nullable
              as List<RoutePayments>?,
      merchants: null == merchants
          ? _value._merchants
          : merchants // ignore: cast_nullable_to_non_nullable
              as List<DatabaseStore>,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bagiView: null == bagiView
          ? _value.bagiView
          : bagiView // ignore: cast_nullable_to_non_nullable
              as BagiView,
    ));
  }
}

/// @nodoc

class _$BagiStateImpl implements _BagiState {
  const _$BagiStateImpl(
      {this.status = DataStateStatus.initial,
      this.store,
      final List<SplitPaymentTemplate> paymentTemplate = const [],
      final List<RoutePayments>? routePayment = const [],
      final List<DatabaseStore> merchants = const [],
      this.id,
      this.bagiView = BagiView.list})
      : _paymentTemplate = paymentTemplate,
        _routePayment = routePayment,
        _merchants = merchants;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final Store? store;
  final List<SplitPaymentTemplate> _paymentTemplate;
  @override
  @JsonKey()
  List<SplitPaymentTemplate> get paymentTemplate {
    if (_paymentTemplate is EqualUnmodifiableListView) return _paymentTemplate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentTemplate);
  }

  final List<RoutePayments>? _routePayment;
  @override
  @JsonKey()
  List<RoutePayments>? get routePayment {
    final value = _routePayment;
    if (value == null) return null;
    if (_routePayment is EqualUnmodifiableListView) return _routePayment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<DatabaseStore> _merchants;
  @override
  @JsonKey()
  List<DatabaseStore> get merchants {
    if (_merchants is EqualUnmodifiableListView) return _merchants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_merchants);
  }

  @override
  final String? id;
  @override
  @JsonKey()
  final BagiView bagiView;

  @override
  String toString() {
    return 'BagiState(status: $status, store: $store, paymentTemplate: $paymentTemplate, routePayment: $routePayment, merchants: $merchants, id: $id, bagiView: $bagiView)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BagiStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.store, store) || other.store == store) &&
            const DeepCollectionEquality()
                .equals(other._paymentTemplate, _paymentTemplate) &&
            const DeepCollectionEquality()
                .equals(other._routePayment, _routePayment) &&
            const DeepCollectionEquality()
                .equals(other._merchants, _merchants) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bagiView, bagiView) ||
                other.bagiView == bagiView));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      store,
      const DeepCollectionEquality().hash(_paymentTemplate),
      const DeepCollectionEquality().hash(_routePayment),
      const DeepCollectionEquality().hash(_merchants),
      id,
      bagiView);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BagiStateImplCopyWith<_$BagiStateImpl> get copyWith =>
      __$$BagiStateImplCopyWithImpl<_$BagiStateImpl>(this, _$identity);
}

abstract class _BagiState implements BagiState {
  const factory _BagiState(
      {final DataStateStatus status,
      final Store? store,
      final List<SplitPaymentTemplate> paymentTemplate,
      final List<RoutePayments>? routePayment,
      final List<DatabaseStore> merchants,
      final String? id,
      final BagiView bagiView}) = _$BagiStateImpl;

  @override
  DataStateStatus get status;
  @override
  Store? get store;
  @override
  List<SplitPaymentTemplate> get paymentTemplate;
  @override
  List<RoutePayments>? get routePayment;
  @override
  List<DatabaseStore> get merchants;
  @override
  String? get id;
  @override
  BagiView get bagiView;
  @override
  @JsonKey(ignore: true)
  _$$BagiStateImplCopyWith<_$BagiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
