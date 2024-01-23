// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'process_instalation_item_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProcessInstalationItemState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;
  List<TransactionItem> get item => throw _privateConstructorUsedError;
  List<XFile> get pickedImage => throw _privateConstructorUsedError;
  List<String> get listBase64 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProcessInstalationItemStateCopyWith<ProcessInstalationItemState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessInstalationItemStateCopyWith<$Res> {
  factory $ProcessInstalationItemStateCopyWith(
          ProcessInstalationItemState value,
          $Res Function(ProcessInstalationItemState) then) =
      _$ProcessInstalationItemStateCopyWithImpl<$Res,
          ProcessInstalationItemState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      String? err,
      List<TransactionItem> item,
      List<XFile> pickedImage,
      List<String> listBase64});
}

/// @nodoc
class _$ProcessInstalationItemStateCopyWithImpl<$Res,
        $Val extends ProcessInstalationItemState>
    implements $ProcessInstalationItemStateCopyWith<$Res> {
  _$ProcessInstalationItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? item = null,
    Object? pickedImage = null,
    Object? listBase64 = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      pickedImage: null == pickedImage
          ? _value.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      listBase64: null == listBase64
          ? _value.listBase64
          : listBase64 // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessInstalationItemStateImplCopyWith<$Res>
    implements $ProcessInstalationItemStateCopyWith<$Res> {
  factory _$$ProcessInstalationItemStateImplCopyWith(
          _$ProcessInstalationItemStateImpl value,
          $Res Function(_$ProcessInstalationItemStateImpl) then) =
      __$$ProcessInstalationItemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      String? err,
      List<TransactionItem> item,
      List<XFile> pickedImage,
      List<String> listBase64});
}

/// @nodoc
class __$$ProcessInstalationItemStateImplCopyWithImpl<$Res>
    extends _$ProcessInstalationItemStateCopyWithImpl<$Res,
        _$ProcessInstalationItemStateImpl>
    implements _$$ProcessInstalationItemStateImplCopyWith<$Res> {
  __$$ProcessInstalationItemStateImplCopyWithImpl(
      _$ProcessInstalationItemStateImpl _value,
      $Res Function(_$ProcessInstalationItemStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? item = null,
    Object? pickedImage = null,
    Object? listBase64 = null,
  }) {
    return _then(_$ProcessInstalationItemStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      item: null == item
          ? _value._item
          : item // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      pickedImage: null == pickedImage
          ? _value._pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      listBase64: null == listBase64
          ? _value._listBase64
          : listBase64 // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ProcessInstalationItemStateImpl
    implements _ProcessInstalationItemState {
  const _$ProcessInstalationItemStateImpl(
      {this.status = DataStateStatus.initial,
      this.err,
      final List<TransactionItem> item = const [],
      final List<XFile> pickedImage = const [],
      final List<String> listBase64 = const []})
      : _item = item,
        _pickedImage = pickedImage,
        _listBase64 = listBase64;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? err;
  final List<TransactionItem> _item;
  @override
  @JsonKey()
  List<TransactionItem> get item {
    if (_item is EqualUnmodifiableListView) return _item;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_item);
  }

  final List<XFile> _pickedImage;
  @override
  @JsonKey()
  List<XFile> get pickedImage {
    if (_pickedImage is EqualUnmodifiableListView) return _pickedImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pickedImage);
  }

  final List<String> _listBase64;
  @override
  @JsonKey()
  List<String> get listBase64 {
    if (_listBase64 is EqualUnmodifiableListView) return _listBase64;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listBase64);
  }

  @override
  String toString() {
    return 'ProcessInstalationItemState(status: $status, err: $err, item: $item, pickedImage: $pickedImage, listBase64: $listBase64)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessInstalationItemStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.err, err) || other.err == err) &&
            const DeepCollectionEquality().equals(other._item, _item) &&
            const DeepCollectionEquality()
                .equals(other._pickedImage, _pickedImage) &&
            const DeepCollectionEquality()
                .equals(other._listBase64, _listBase64));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      err,
      const DeepCollectionEquality().hash(_item),
      const DeepCollectionEquality().hash(_pickedImage),
      const DeepCollectionEquality().hash(_listBase64));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessInstalationItemStateImplCopyWith<_$ProcessInstalationItemStateImpl>
      get copyWith => __$$ProcessInstalationItemStateImplCopyWithImpl<
          _$ProcessInstalationItemStateImpl>(this, _$identity);
}

abstract class _ProcessInstalationItemState
    implements ProcessInstalationItemState {
  const factory _ProcessInstalationItemState(
      {final DataStateStatus status,
      final String? err,
      final List<TransactionItem> item,
      final List<XFile> pickedImage,
      final List<String> listBase64}) = _$ProcessInstalationItemStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get err;
  @override
  List<TransactionItem> get item;
  @override
  List<XFile> get pickedImage;
  @override
  List<String> get listBase64;
  @override
  @JsonKey(ignore: true)
  _$$ProcessInstalationItemStateImplCopyWith<_$ProcessInstalationItemStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
