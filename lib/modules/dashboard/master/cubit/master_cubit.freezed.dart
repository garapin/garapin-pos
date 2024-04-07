// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MasterState {
  Store? get store => throw _privateConstructorUsedError;
  bool get showPage => throw _privateConstructorUsedError;
  DataStateStatus get status => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  Widget get widget => throw _privateConstructorUsedError;
  bool get isInitialMaster => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MasterStateCopyWith<MasterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterStateCopyWith<$Res> {
  factory $MasterStateCopyWith(
          MasterState value, $Res Function(MasterState) then) =
      _$MasterStateCopyWithImpl<$Res, MasterState>;
  @useResult
  $Res call(
      {Store? store,
      bool showPage,
      DataStateStatus status,
      int index,
      Widget widget,
      bool isInitialMaster});
}

/// @nodoc
class _$MasterStateCopyWithImpl<$Res, $Val extends MasterState>
    implements $MasterStateCopyWith<$Res> {
  _$MasterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = freezed,
    Object? showPage = null,
    Object? status = null,
    Object? index = null,
    Object? widget = null,
    Object? isInitialMaster = null,
  }) {
    return _then(_value.copyWith(
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      showPage: null == showPage
          ? _value.showPage
          : showPage // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      widget: null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as Widget,
      isInitialMaster: null == isInitialMaster
          ? _value.isInitialMaster
          : isInitialMaster // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MasterStateImplCopyWith<$Res>
    implements $MasterStateCopyWith<$Res> {
  factory _$$MasterStateImplCopyWith(
          _$MasterStateImpl value, $Res Function(_$MasterStateImpl) then) =
      __$$MasterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Store? store,
      bool showPage,
      DataStateStatus status,
      int index,
      Widget widget,
      bool isInitialMaster});
}

/// @nodoc
class __$$MasterStateImplCopyWithImpl<$Res>
    extends _$MasterStateCopyWithImpl<$Res, _$MasterStateImpl>
    implements _$$MasterStateImplCopyWith<$Res> {
  __$$MasterStateImplCopyWithImpl(
      _$MasterStateImpl _value, $Res Function(_$MasterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = freezed,
    Object? showPage = null,
    Object? status = null,
    Object? index = null,
    Object? widget = null,
    Object? isInitialMaster = null,
  }) {
    return _then(_$MasterStateImpl(
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      showPage: null == showPage
          ? _value.showPage
          : showPage // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      widget: null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as Widget,
      isInitialMaster: null == isInitialMaster
          ? _value.isInitialMaster
          : isInitialMaster // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MasterStateImpl implements _MasterState {
  const _$MasterStateImpl(
      {this.store,
      this.showPage = true,
      this.status = DataStateStatus.initial,
      this.index = 0,
      this.widget = const SizedBox(),
      this.isInitialMaster = true});

  @override
  final Store? store;
  @override
  @JsonKey()
  final bool showPage;
  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final Widget widget;
  @override
  @JsonKey()
  final bool isInitialMaster;

  @override
  String toString() {
    return 'MasterState(store: $store, showPage: $showPage, status: $status, index: $index, widget: $widget, isInitialMaster: $isInitialMaster)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasterStateImpl &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.showPage, showPage) ||
                other.showPage == showPage) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.widget, widget) || other.widget == widget) &&
            (identical(other.isInitialMaster, isInitialMaster) ||
                other.isInitialMaster == isInitialMaster));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, store, showPage, status, index, widget, isInitialMaster);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MasterStateImplCopyWith<_$MasterStateImpl> get copyWith =>
      __$$MasterStateImplCopyWithImpl<_$MasterStateImpl>(this, _$identity);
}

abstract class _MasterState implements MasterState {
  const factory _MasterState(
      {final Store? store,
      final bool showPage,
      final DataStateStatus status,
      final int index,
      final Widget widget,
      final bool isInitialMaster}) = _$MasterStateImpl;

  @override
  Store? get store;
  @override
  bool get showPage;
  @override
  DataStateStatus get status;
  @override
  int get index;
  @override
  Widget get widget;
  @override
  bool get isInitialMaster;
  @override
  @JsonKey(ignore: true)
  _$$MasterStateImplCopyWith<_$MasterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
