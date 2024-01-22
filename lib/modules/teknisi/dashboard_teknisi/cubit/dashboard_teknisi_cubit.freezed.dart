// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_teknisi_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DashboardTeknisiState {
  Widget get currentScreen => throw _privateConstructorUsedError;
  int get currentTab => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardTeknisiStateCopyWith<DashboardTeknisiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardTeknisiStateCopyWith<$Res> {
  factory $DashboardTeknisiStateCopyWith(DashboardTeknisiState value,
          $Res Function(DashboardTeknisiState) then) =
      _$DashboardTeknisiStateCopyWithImpl<$Res, DashboardTeknisiState>;
  @useResult
  $Res call({Widget currentScreen, int currentTab});
}

/// @nodoc
class _$DashboardTeknisiStateCopyWithImpl<$Res,
        $Val extends DashboardTeknisiState>
    implements $DashboardTeknisiStateCopyWith<$Res> {
  _$DashboardTeknisiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentScreen = null,
    Object? currentTab = null,
  }) {
    return _then(_value.copyWith(
      currentScreen: null == currentScreen
          ? _value.currentScreen
          : currentScreen // ignore: cast_nullable_to_non_nullable
              as Widget,
      currentTab: null == currentTab
          ? _value.currentTab
          : currentTab // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardTeknisiStateImplCopyWith<$Res>
    implements $DashboardTeknisiStateCopyWith<$Res> {
  factory _$$DashboardTeknisiStateImplCopyWith(
          _$DashboardTeknisiStateImpl value,
          $Res Function(_$DashboardTeknisiStateImpl) then) =
      __$$DashboardTeknisiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Widget currentScreen, int currentTab});
}

/// @nodoc
class __$$DashboardTeknisiStateImplCopyWithImpl<$Res>
    extends _$DashboardTeknisiStateCopyWithImpl<$Res,
        _$DashboardTeknisiStateImpl>
    implements _$$DashboardTeknisiStateImplCopyWith<$Res> {
  __$$DashboardTeknisiStateImplCopyWithImpl(_$DashboardTeknisiStateImpl _value,
      $Res Function(_$DashboardTeknisiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentScreen = null,
    Object? currentTab = null,
  }) {
    return _then(_$DashboardTeknisiStateImpl(
      currentScreen: null == currentScreen
          ? _value.currentScreen
          : currentScreen // ignore: cast_nullable_to_non_nullable
              as Widget,
      currentTab: null == currentTab
          ? _value.currentTab
          : currentTab // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DashboardTeknisiStateImpl implements _DashboardTeknisiState {
  const _$DashboardTeknisiStateImpl(
      {required this.currentScreen, required this.currentTab});

  @override
  final Widget currentScreen;
  @override
  final int currentTab;

  @override
  String toString() {
    return 'DashboardTeknisiState(currentScreen: $currentScreen, currentTab: $currentTab)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardTeknisiStateImpl &&
            (identical(other.currentScreen, currentScreen) ||
                other.currentScreen == currentScreen) &&
            (identical(other.currentTab, currentTab) ||
                other.currentTab == currentTab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentScreen, currentTab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardTeknisiStateImplCopyWith<_$DashboardTeknisiStateImpl>
      get copyWith => __$$DashboardTeknisiStateImplCopyWithImpl<
          _$DashboardTeknisiStateImpl>(this, _$identity);
}

abstract class _DashboardTeknisiState implements DashboardTeknisiState {
  const factory _DashboardTeknisiState(
      {required final Widget currentScreen,
      required final int currentTab}) = _$DashboardTeknisiStateImpl;

  @override
  Widget get currentScreen;
  @override
  int get currentTab;
  @override
  @JsonKey(ignore: true)
  _$$DashboardTeknisiStateImplCopyWith<_$DashboardTeknisiStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
