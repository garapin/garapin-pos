// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryTransactionState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  List<Invoices> get inv => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryTransactionStateCopyWith<HistoryTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryTransactionStateCopyWith<$Res> {
  factory $HistoryTransactionStateCopyWith(HistoryTransactionState value,
          $Res Function(HistoryTransactionState) then) =
      _$HistoryTransactionStateCopyWithImpl<$Res, HistoryTransactionState>;
  @useResult
  $Res call({DataStateStatus status, List<Invoices> inv, String? err});
}

/// @nodoc
class _$HistoryTransactionStateCopyWithImpl<$Res,
        $Val extends HistoryTransactionState>
    implements $HistoryTransactionStateCopyWith<$Res> {
  _$HistoryTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? inv = null,
    Object? err = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      inv: null == inv
          ? _value.inv
          : inv // ignore: cast_nullable_to_non_nullable
              as List<Invoices>,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryTransactionStateImplCopyWith<$Res>
    implements $HistoryTransactionStateCopyWith<$Res> {
  factory _$$HistoryTransactionStateImplCopyWith(
          _$HistoryTransactionStateImpl value,
          $Res Function(_$HistoryTransactionStateImpl) then) =
      __$$HistoryTransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DataStateStatus status, List<Invoices> inv, String? err});
}

/// @nodoc
class __$$HistoryTransactionStateImplCopyWithImpl<$Res>
    extends _$HistoryTransactionStateCopyWithImpl<$Res,
        _$HistoryTransactionStateImpl>
    implements _$$HistoryTransactionStateImplCopyWith<$Res> {
  __$$HistoryTransactionStateImplCopyWithImpl(
      _$HistoryTransactionStateImpl _value,
      $Res Function(_$HistoryTransactionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? inv = null,
    Object? err = freezed,
  }) {
    return _then(_$HistoryTransactionStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      inv: null == inv
          ? _value._inv
          : inv // ignore: cast_nullable_to_non_nullable
              as List<Invoices>,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HistoryTransactionStateImpl implements _HistoryTransactionState {
  const _$HistoryTransactionStateImpl(
      {this.status = DataStateStatus.initial,
      final List<Invoices> inv = const [],
      this.err})
      : _inv = inv;

  @override
  @JsonKey()
  final DataStateStatus status;
  final List<Invoices> _inv;
  @override
  @JsonKey()
  List<Invoices> get inv {
    if (_inv is EqualUnmodifiableListView) return _inv;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inv);
  }

  @override
  final String? err;

  @override
  String toString() {
    return 'HistoryTransactionState(status: $status, inv: $inv, err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryTransactionStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._inv, _inv) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_inv), err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryTransactionStateImplCopyWith<_$HistoryTransactionStateImpl>
      get copyWith => __$$HistoryTransactionStateImplCopyWithImpl<
          _$HistoryTransactionStateImpl>(this, _$identity);
}

abstract class _HistoryTransactionState implements HistoryTransactionState {
  const factory _HistoryTransactionState(
      {final DataStateStatus status,
      final List<Invoices> inv,
      final String? err}) = _$HistoryTransactionStateImpl;

  @override
  DataStateStatus get status;
  @override
  List<Invoices> get inv;
  @override
  String? get err;
  @override
  @JsonKey(ignore: true)
  _$$HistoryTransactionStateImplCopyWith<_$HistoryTransactionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
