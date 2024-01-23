// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_item_instalation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListItemInstalationState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  List<TransactionItem> get item => throw _privateConstructorUsedError;
  List<TransactionItem> get selectedItem => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListItemInstalationStateCopyWith<ListItemInstalationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListItemInstalationStateCopyWith<$Res> {
  factory $ListItemInstalationStateCopyWith(ListItemInstalationState value,
          $Res Function(ListItemInstalationState) then) =
      _$ListItemInstalationStateCopyWithImpl<$Res, ListItemInstalationState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      List<TransactionItem> item,
      List<TransactionItem> selectedItem,
      String? err});
}

/// @nodoc
class _$ListItemInstalationStateCopyWithImpl<$Res,
        $Val extends ListItemInstalationState>
    implements $ListItemInstalationStateCopyWith<$Res> {
  _$ListItemInstalationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? item = null,
    Object? selectedItem = null,
    Object? err = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListItemInstalationStateImplCopyWith<$Res>
    implements $ListItemInstalationStateCopyWith<$Res> {
  factory _$$ListItemInstalationStateImplCopyWith(
          _$ListItemInstalationStateImpl value,
          $Res Function(_$ListItemInstalationStateImpl) then) =
      __$$ListItemInstalationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      List<TransactionItem> item,
      List<TransactionItem> selectedItem,
      String? err});
}

/// @nodoc
class __$$ListItemInstalationStateImplCopyWithImpl<$Res>
    extends _$ListItemInstalationStateCopyWithImpl<$Res,
        _$ListItemInstalationStateImpl>
    implements _$$ListItemInstalationStateImplCopyWith<$Res> {
  __$$ListItemInstalationStateImplCopyWithImpl(
      _$ListItemInstalationStateImpl _value,
      $Res Function(_$ListItemInstalationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? item = null,
    Object? selectedItem = null,
    Object? err = freezed,
  }) {
    return _then(_$ListItemInstalationStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      item: null == item
          ? _value._item
          : item // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      selectedItem: null == selectedItem
          ? _value._selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ListItemInstalationStateImpl implements _ListItemInstalationState {
  const _$ListItemInstalationStateImpl(
      {this.status = DataStateStatus.initial,
      final List<TransactionItem> item = const [],
      final List<TransactionItem> selectedItem = const [],
      this.err})
      : _item = item,
        _selectedItem = selectedItem;

  @override
  @JsonKey()
  final DataStateStatus status;
  final List<TransactionItem> _item;
  @override
  @JsonKey()
  List<TransactionItem> get item {
    if (_item is EqualUnmodifiableListView) return _item;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_item);
  }

  final List<TransactionItem> _selectedItem;
  @override
  @JsonKey()
  List<TransactionItem> get selectedItem {
    if (_selectedItem is EqualUnmodifiableListView) return _selectedItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedItem);
  }

  @override
  final String? err;

  @override
  String toString() {
    return 'ListItemInstalationState(status: $status, item: $item, selectedItem: $selectedItem, err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListItemInstalationStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._item, _item) &&
            const DeepCollectionEquality()
                .equals(other._selectedItem, _selectedItem) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_item),
      const DeepCollectionEquality().hash(_selectedItem),
      err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListItemInstalationStateImplCopyWith<_$ListItemInstalationStateImpl>
      get copyWith => __$$ListItemInstalationStateImplCopyWithImpl<
          _$ListItemInstalationStateImpl>(this, _$identity);
}

abstract class _ListItemInstalationState implements ListItemInstalationState {
  const factory _ListItemInstalationState(
      {final DataStateStatus status,
      final List<TransactionItem> item,
      final List<TransactionItem> selectedItem,
      final String? err}) = _$ListItemInstalationStateImpl;

  @override
  DataStateStatus get status;
  @override
  List<TransactionItem> get item;
  @override
  List<TransactionItem> get selectedItem;
  @override
  String? get err;
  @override
  @JsonKey(ignore: true)
  _$$ListItemInstalationStateImplCopyWith<_$ListItemInstalationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
