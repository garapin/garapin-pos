// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReportDetailState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  SplitPaymentDetail? get split => throw _privateConstructorUsedError;
  Invoices? get invoice => throw _privateConstructorUsedError;
  Store? get store => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportDetailStateCopyWith<ReportDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDetailStateCopyWith<$Res> {
  factory $ReportDetailStateCopyWith(
          ReportDetailState value, $Res Function(ReportDetailState) then) =
      _$ReportDetailStateCopyWithImpl<$Res, ReportDetailState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      SplitPaymentDetail? split,
      Invoices? invoice,
      Store? store,
      String? err});
}

/// @nodoc
class _$ReportDetailStateCopyWithImpl<$Res, $Val extends ReportDetailState>
    implements $ReportDetailStateCopyWith<$Res> {
  _$ReportDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? split = freezed,
    Object? invoice = freezed,
    Object? store = freezed,
    Object? err = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      split: freezed == split
          ? _value.split
          : split // ignore: cast_nullable_to_non_nullable
              as SplitPaymentDetail?,
      invoice: freezed == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as Invoices?,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportDetailStateImplCopyWith<$Res>
    implements $ReportDetailStateCopyWith<$Res> {
  factory _$$ReportDetailStateImplCopyWith(_$ReportDetailStateImpl value,
          $Res Function(_$ReportDetailStateImpl) then) =
      __$$ReportDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      SplitPaymentDetail? split,
      Invoices? invoice,
      Store? store,
      String? err});
}

/// @nodoc
class __$$ReportDetailStateImplCopyWithImpl<$Res>
    extends _$ReportDetailStateCopyWithImpl<$Res, _$ReportDetailStateImpl>
    implements _$$ReportDetailStateImplCopyWith<$Res> {
  __$$ReportDetailStateImplCopyWithImpl(_$ReportDetailStateImpl _value,
      $Res Function(_$ReportDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? split = freezed,
    Object? invoice = freezed,
    Object? store = freezed,
    Object? err = freezed,
  }) {
    return _then(_$ReportDetailStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      split: freezed == split
          ? _value.split
          : split // ignore: cast_nullable_to_non_nullable
              as SplitPaymentDetail?,
      invoice: freezed == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as Invoices?,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReportDetailStateImpl implements _ReportDetailState {
  const _$ReportDetailStateImpl(
      {this.status = DataStateStatus.initial,
      this.split,
      this.invoice,
      this.store,
      this.err});

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final SplitPaymentDetail? split;
  @override
  final Invoices? invoice;
  @override
  final Store? store;
  @override
  final String? err;

  @override
  String toString() {
    return 'ReportDetailState(status: $status, split: $split, invoice: $invoice, store: $store, err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportDetailStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.split, split) || other.split == split) &&
            (identical(other.invoice, invoice) || other.invoice == invoice) &&
            const DeepCollectionEquality().equals(other.store, store) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, split, invoice,
      const DeepCollectionEquality().hash(store), err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportDetailStateImplCopyWith<_$ReportDetailStateImpl> get copyWith =>
      __$$ReportDetailStateImplCopyWithImpl<_$ReportDetailStateImpl>(
          this, _$identity);
}

abstract class _ReportDetailState implements ReportDetailState {
  const factory _ReportDetailState(
      {final DataStateStatus status,
      final SplitPaymentDetail? split,
      final Invoices? invoice,
      final Store? store,
      final String? err}) = _$ReportDetailStateImpl;

  @override
  DataStateStatus get status;
  @override
  SplitPaymentDetail? get split;
  @override
  Invoices? get invoice;
  @override
  Store? get store;
  @override
  String? get err;
  @override
  @JsonKey(ignore: true)
  _$$ReportDetailStateImplCopyWith<_$ReportDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
