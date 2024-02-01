// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_vehicle_installed_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListVehicleInstalledState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  List<Vehicle> get vehicle => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListVehicleInstalledStateCopyWith<ListVehicleInstalledState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListVehicleInstalledStateCopyWith<$Res> {
  factory $ListVehicleInstalledStateCopyWith(ListVehicleInstalledState value,
          $Res Function(ListVehicleInstalledState) then) =
      _$ListVehicleInstalledStateCopyWithImpl<$Res, ListVehicleInstalledState>;
  @useResult
  $Res call({DataStateStatus status, List<Vehicle> vehicle, String? err});
}

/// @nodoc
class _$ListVehicleInstalledStateCopyWithImpl<$Res,
        $Val extends ListVehicleInstalledState>
    implements $ListVehicleInstalledStateCopyWith<$Res> {
  _$ListVehicleInstalledStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? vehicle = null,
    Object? err = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as List<Vehicle>,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListVehicleInstalledStateImplCopyWith<$Res>
    implements $ListVehicleInstalledStateCopyWith<$Res> {
  factory _$$ListVehicleInstalledStateImplCopyWith(
          _$ListVehicleInstalledStateImpl value,
          $Res Function(_$ListVehicleInstalledStateImpl) then) =
      __$$ListVehicleInstalledStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DataStateStatus status, List<Vehicle> vehicle, String? err});
}

/// @nodoc
class __$$ListVehicleInstalledStateImplCopyWithImpl<$Res>
    extends _$ListVehicleInstalledStateCopyWithImpl<$Res,
        _$ListVehicleInstalledStateImpl>
    implements _$$ListVehicleInstalledStateImplCopyWith<$Res> {
  __$$ListVehicleInstalledStateImplCopyWithImpl(
      _$ListVehicleInstalledStateImpl _value,
      $Res Function(_$ListVehicleInstalledStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? vehicle = null,
    Object? err = freezed,
  }) {
    return _then(_$ListVehicleInstalledStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      vehicle: null == vehicle
          ? _value._vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as List<Vehicle>,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ListVehicleInstalledStateImpl implements _ListVehicleInstalledState {
  const _$ListVehicleInstalledStateImpl(
      {this.status = DataStateStatus.initial,
      final List<Vehicle> vehicle = const [],
      this.err})
      : _vehicle = vehicle;

  @override
  @JsonKey()
  final DataStateStatus status;
  final List<Vehicle> _vehicle;
  @override
  @JsonKey()
  List<Vehicle> get vehicle {
    if (_vehicle is EqualUnmodifiableListView) return _vehicle;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vehicle);
  }

  @override
  final String? err;

  @override
  String toString() {
    return 'ListVehicleInstalledState(status: $status, vehicle: $vehicle, err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListVehicleInstalledStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._vehicle, _vehicle) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_vehicle), err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListVehicleInstalledStateImplCopyWith<_$ListVehicleInstalledStateImpl>
      get copyWith => __$$ListVehicleInstalledStateImplCopyWithImpl<
          _$ListVehicleInstalledStateImpl>(this, _$identity);
}

abstract class _ListVehicleInstalledState implements ListVehicleInstalledState {
  const factory _ListVehicleInstalledState(
      {final DataStateStatus status,
      final List<Vehicle> vehicle,
      final String? err}) = _$ListVehicleInstalledStateImpl;

  @override
  DataStateStatus get status;
  @override
  List<Vehicle> get vehicle;
  @override
  String? get err;
  @override
  @JsonKey(ignore: true)
  _$$ListVehicleInstalledStateImplCopyWith<_$ListVehicleInstalledStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
