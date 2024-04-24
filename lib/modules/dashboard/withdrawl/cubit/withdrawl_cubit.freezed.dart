// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdrawl_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WithdrawlState {
  bool get isPinMatch => throw _privateConstructorUsedError;
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;
  AccountBalance? get accountBalance => throw _privateConstructorUsedError;
  List<WithdrawHistory> get history => throw _privateConstructorUsedError;
  List<AvailablePayment> get availablePayment =>
      throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WithdrawlStateCopyWith<WithdrawlState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawlStateCopyWith<$Res> {
  factory $WithdrawlStateCopyWith(
          WithdrawlState value, $Res Function(WithdrawlState) then) =
      _$WithdrawlStateCopyWithImpl<$Res, WithdrawlState>;
  @useResult
  $Res call(
      {bool isPinMatch,
      DataStateStatus status,
      String? err,
      AccountBalance? accountBalance,
      List<WithdrawHistory> history,
      List<AvailablePayment> availablePayment,
      String? startDate,
      String? endDate});
}

/// @nodoc
class _$WithdrawlStateCopyWithImpl<$Res, $Val extends WithdrawlState>
    implements $WithdrawlStateCopyWith<$Res> {
  _$WithdrawlStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPinMatch = null,
    Object? status = null,
    Object? err = freezed,
    Object? accountBalance = freezed,
    Object? history = null,
    Object? availablePayment = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      isPinMatch: null == isPinMatch
          ? _value.isPinMatch
          : isPinMatch // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      accountBalance: freezed == accountBalance
          ? _value.accountBalance
          : accountBalance // ignore: cast_nullable_to_non_nullable
              as AccountBalance?,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<WithdrawHistory>,
      availablePayment: null == availablePayment
          ? _value.availablePayment
          : availablePayment // ignore: cast_nullable_to_non_nullable
              as List<AvailablePayment>,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WithdrawlStateImplCopyWith<$Res>
    implements $WithdrawlStateCopyWith<$Res> {
  factory _$$WithdrawlStateImplCopyWith(_$WithdrawlStateImpl value,
          $Res Function(_$WithdrawlStateImpl) then) =
      __$$WithdrawlStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isPinMatch,
      DataStateStatus status,
      String? err,
      AccountBalance? accountBalance,
      List<WithdrawHistory> history,
      List<AvailablePayment> availablePayment,
      String? startDate,
      String? endDate});
}

/// @nodoc
class __$$WithdrawlStateImplCopyWithImpl<$Res>
    extends _$WithdrawlStateCopyWithImpl<$Res, _$WithdrawlStateImpl>
    implements _$$WithdrawlStateImplCopyWith<$Res> {
  __$$WithdrawlStateImplCopyWithImpl(
      _$WithdrawlStateImpl _value, $Res Function(_$WithdrawlStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPinMatch = null,
    Object? status = null,
    Object? err = freezed,
    Object? accountBalance = freezed,
    Object? history = null,
    Object? availablePayment = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$WithdrawlStateImpl(
      isPinMatch: null == isPinMatch
          ? _value.isPinMatch
          : isPinMatch // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      accountBalance: freezed == accountBalance
          ? _value.accountBalance
          : accountBalance // ignore: cast_nullable_to_non_nullable
              as AccountBalance?,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<WithdrawHistory>,
      availablePayment: null == availablePayment
          ? _value._availablePayment
          : availablePayment // ignore: cast_nullable_to_non_nullable
              as List<AvailablePayment>,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WithdrawlStateImpl implements _WithdrawlState {
  const _$WithdrawlStateImpl(
      {this.isPinMatch = false,
      this.status = DataStateStatus.initial,
      this.err,
      this.accountBalance,
      final List<WithdrawHistory> history = const [],
      final List<AvailablePayment> availablePayment = const [],
      this.startDate,
      this.endDate})
      : _history = history,
        _availablePayment = availablePayment;

  @override
  @JsonKey()
  final bool isPinMatch;
  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? err;
  @override
  final AccountBalance? accountBalance;
  final List<WithdrawHistory> _history;
  @override
  @JsonKey()
  List<WithdrawHistory> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  final List<AvailablePayment> _availablePayment;
  @override
  @JsonKey()
  List<AvailablePayment> get availablePayment {
    if (_availablePayment is EqualUnmodifiableListView)
      return _availablePayment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availablePayment);
  }

  @override
  final String? startDate;
  @override
  final String? endDate;

  @override
  String toString() {
    return 'WithdrawlState(isPinMatch: $isPinMatch, status: $status, err: $err, accountBalance: $accountBalance, history: $history, availablePayment: $availablePayment, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawlStateImpl &&
            (identical(other.isPinMatch, isPinMatch) ||
                other.isPinMatch == isPinMatch) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.err, err) || other.err == err) &&
            (identical(other.accountBalance, accountBalance) ||
                other.accountBalance == accountBalance) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            const DeepCollectionEquality()
                .equals(other._availablePayment, _availablePayment) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isPinMatch,
      status,
      err,
      accountBalance,
      const DeepCollectionEquality().hash(_history),
      const DeepCollectionEquality().hash(_availablePayment),
      startDate,
      endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawlStateImplCopyWith<_$WithdrawlStateImpl> get copyWith =>
      __$$WithdrawlStateImplCopyWithImpl<_$WithdrawlStateImpl>(
          this, _$identity);
}

abstract class _WithdrawlState implements WithdrawlState {
  const factory _WithdrawlState(
      {final bool isPinMatch,
      final DataStateStatus status,
      final String? err,
      final AccountBalance? accountBalance,
      final List<WithdrawHistory> history,
      final List<AvailablePayment> availablePayment,
      final String? startDate,
      final String? endDate}) = _$WithdrawlStateImpl;

  @override
  bool get isPinMatch;
  @override
  DataStateStatus get status;
  @override
  String? get err;
  @override
  AccountBalance? get accountBalance;
  @override
  List<WithdrawHistory> get history;
  @override
  List<AvailablePayment> get availablePayment;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$WithdrawlStateImplCopyWith<_$WithdrawlStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
