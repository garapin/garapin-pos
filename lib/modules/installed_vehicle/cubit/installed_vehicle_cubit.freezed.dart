// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'installed_vehicle_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InstalledVehicleState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  List<InstalationVehicle> get instalationVehicle =>
      throw _privateConstructorUsedError;
  List<Item> get listItem => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InstalledVehicleStateCopyWith<InstalledVehicleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstalledVehicleStateCopyWith<$Res> {
  factory $InstalledVehicleStateCopyWith(InstalledVehicleState value,
          $Res Function(InstalledVehicleState) then) =
      _$InstalledVehicleStateCopyWithImpl<$Res, InstalledVehicleState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      List<InstalationVehicle> instalationVehicle,
      List<Item> listItem,
      String? err});
}

/// @nodoc
class _$InstalledVehicleStateCopyWithImpl<$Res,
        $Val extends InstalledVehicleState>
    implements $InstalledVehicleStateCopyWith<$Res> {
  _$InstalledVehicleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? instalationVehicle = null,
    Object? listItem = null,
    Object? err = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      instalationVehicle: null == instalationVehicle
          ? _value.instalationVehicle
          : instalationVehicle // ignore: cast_nullable_to_non_nullable
              as List<InstalationVehicle>,
      listItem: null == listItem
          ? _value.listItem
          : listItem // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstalledVehicleStateImplCopyWith<$Res>
    implements $InstalledVehicleStateCopyWith<$Res> {
  factory _$$InstalledVehicleStateImplCopyWith(
          _$InstalledVehicleStateImpl value,
          $Res Function(_$InstalledVehicleStateImpl) then) =
      __$$InstalledVehicleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      List<InstalationVehicle> instalationVehicle,
      List<Item> listItem,
      String? err});
}

/// @nodoc
class __$$InstalledVehicleStateImplCopyWithImpl<$Res>
    extends _$InstalledVehicleStateCopyWithImpl<$Res,
        _$InstalledVehicleStateImpl>
    implements _$$InstalledVehicleStateImplCopyWith<$Res> {
  __$$InstalledVehicleStateImplCopyWithImpl(_$InstalledVehicleStateImpl _value,
      $Res Function(_$InstalledVehicleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? instalationVehicle = null,
    Object? listItem = null,
    Object? err = freezed,
  }) {
    return _then(_$InstalledVehicleStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      instalationVehicle: null == instalationVehicle
          ? _value._instalationVehicle
          : instalationVehicle // ignore: cast_nullable_to_non_nullable
              as List<InstalationVehicle>,
      listItem: null == listItem
          ? _value._listItem
          : listItem // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InstalledVehicleStateImpl implements _InstalledVehicleState {
  const _$InstalledVehicleStateImpl(
      {this.status = DataStateStatus.initial,
      final List<InstalationVehicle> instalationVehicle = const [],
      final List<Item> listItem = const [],
      this.err})
      : _instalationVehicle = instalationVehicle,
        _listItem = listItem;

  @override
  @JsonKey()
  final DataStateStatus status;
  final List<InstalationVehicle> _instalationVehicle;
  @override
  @JsonKey()
  List<InstalationVehicle> get instalationVehicle {
    if (_instalationVehicle is EqualUnmodifiableListView)
      return _instalationVehicle;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instalationVehicle);
  }

  final List<Item> _listItem;
  @override
  @JsonKey()
  List<Item> get listItem {
    if (_listItem is EqualUnmodifiableListView) return _listItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listItem);
  }

  @override
  final String? err;

  @override
  String toString() {
    return 'InstalledVehicleState(status: $status, instalationVehicle: $instalationVehicle, listItem: $listItem, err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstalledVehicleStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._instalationVehicle, _instalationVehicle) &&
            const DeepCollectionEquality().equals(other._listItem, _listItem) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_instalationVehicle),
      const DeepCollectionEquality().hash(_listItem),
      err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstalledVehicleStateImplCopyWith<_$InstalledVehicleStateImpl>
      get copyWith => __$$InstalledVehicleStateImplCopyWithImpl<
          _$InstalledVehicleStateImpl>(this, _$identity);
}

abstract class _InstalledVehicleState implements InstalledVehicleState {
  const factory _InstalledVehicleState(
      {final DataStateStatus status,
      final List<InstalationVehicle> instalationVehicle,
      final List<Item> listItem,
      final String? err}) = _$InstalledVehicleStateImpl;

  @override
  DataStateStatus get status;
  @override
  List<InstalationVehicle> get instalationVehicle;
  @override
  List<Item> get listItem;
  @override
  String? get err;
  @override
  @JsonKey(ignore: true)
  _$$InstalledVehicleStateImplCopyWith<_$InstalledVehicleStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
