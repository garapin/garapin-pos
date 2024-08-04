// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportTransactionState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  List<FilterStoreTransaction> get filterTemplate =>
      throw _privateConstructorUsedError;
  ReportTransaction? get transaction => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  Store? get store => throw _privateConstructorUsedError;
  String? get targetDatabase => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportTransactionStateCopyWith<ReportTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportTransactionStateCopyWith<$Res> {
  factory $ReportTransactionStateCopyWith(ReportTransactionState value,
          $Res Function(ReportTransactionState) then) =
      _$ReportTransactionStateCopyWithImpl<$Res, ReportTransactionState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      List<FilterStoreTransaction> filterTemplate,
      ReportTransaction? transaction,
      String? startDate,
      String? endDate,
      Store? store,
      String? targetDatabase});
}

/// @nodoc
class _$ReportTransactionStateCopyWithImpl<$Res,
        $Val extends ReportTransactionState>
    implements $ReportTransactionStateCopyWith<$Res> {
  _$ReportTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? filterTemplate = null,
    Object? transaction = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? store = freezed,
    Object? targetDatabase = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      filterTemplate: null == filterTemplate
          ? _value.filterTemplate
          : filterTemplate // ignore: cast_nullable_to_non_nullable
              as List<FilterStoreTransaction>,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as ReportTransaction?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      targetDatabase: freezed == targetDatabase
          ? _value.targetDatabase
          : targetDatabase // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportTransactionStateImplCopyWith<$Res>
    implements $ReportTransactionStateCopyWith<$Res> {
  factory _$$ReportTransactionStateImplCopyWith(
          _$ReportTransactionStateImpl value,
          $Res Function(_$ReportTransactionStateImpl) then) =
      __$$ReportTransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      List<FilterStoreTransaction> filterTemplate,
      ReportTransaction? transaction,
      String? startDate,
      String? endDate,
      Store? store,
      String? targetDatabase});
}

/// @nodoc
class __$$ReportTransactionStateImplCopyWithImpl<$Res>
    extends _$ReportTransactionStateCopyWithImpl<$Res,
        _$ReportTransactionStateImpl>
    implements _$$ReportTransactionStateImplCopyWith<$Res> {
  __$$ReportTransactionStateImplCopyWithImpl(
      _$ReportTransactionStateImpl _value,
      $Res Function(_$ReportTransactionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? filterTemplate = null,
    Object? transaction = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? store = freezed,
    Object? targetDatabase = freezed,
  }) {
    return _then(_$ReportTransactionStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      filterTemplate: null == filterTemplate
          ? _value._filterTemplate
          : filterTemplate // ignore: cast_nullable_to_non_nullable
              as List<FilterStoreTransaction>,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as ReportTransaction?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      targetDatabase: freezed == targetDatabase
          ? _value.targetDatabase
          : targetDatabase // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReportTransactionStateImpl implements _ReportTransactionState {
  const _$ReportTransactionStateImpl(
      {this.status = DataStateStatus.initial,
      final List<FilterStoreTransaction> filterTemplate = const [],
      this.transaction,
      this.startDate,
      this.endDate,
      this.store,
      this.targetDatabase})
      : _filterTemplate = filterTemplate;

  @override
  @JsonKey()
  final DataStateStatus status;
  final List<FilterStoreTransaction> _filterTemplate;
  @override
  @JsonKey()
  List<FilterStoreTransaction> get filterTemplate {
    if (_filterTemplate is EqualUnmodifiableListView) return _filterTemplate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterTemplate);
  }

  @override
  final ReportTransaction? transaction;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  final Store? store;
  @override
  final String? targetDatabase;

  @override
  String toString() {
    return 'ReportTransactionState(status: $status, filterTemplate: $filterTemplate, transaction: $transaction, startDate: $startDate, endDate: $endDate, store: $store, targetDatabase: $targetDatabase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportTransactionStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._filterTemplate, _filterTemplate) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.targetDatabase, targetDatabase) ||
                other.targetDatabase == targetDatabase));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_filterTemplate),
      transaction,
      startDate,
      endDate,
      store,
      targetDatabase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportTransactionStateImplCopyWith<_$ReportTransactionStateImpl>
      get copyWith => __$$ReportTransactionStateImplCopyWithImpl<
          _$ReportTransactionStateImpl>(this, _$identity);
}

abstract class _ReportTransactionState implements ReportTransactionState {
  const factory _ReportTransactionState(
      {final DataStateStatus status,
      final List<FilterStoreTransaction> filterTemplate,
      final ReportTransaction? transaction,
      final String? startDate,
      final String? endDate,
      final Store? store,
      final String? targetDatabase}) = _$ReportTransactionStateImpl;

  @override
  DataStateStatus get status;
  @override
  List<FilterStoreTransaction> get filterTemplate;
  @override
  ReportTransaction? get transaction;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  Store? get store;
  @override
  String? get targetDatabase;
  @override
  @JsonKey(ignore: true)
  _$$ReportTransactionStateImplCopyWith<_$ReportTransactionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
