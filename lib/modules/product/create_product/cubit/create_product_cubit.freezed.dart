// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateProductState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  XFile? get pickedImage => throw _privateConstructorUsedError;
  List<String> get listIcon => throw _privateConstructorUsedError;
  List<CategoryProduct> get category => throw _privateConstructorUsedError;
  List<Brand> get brand => throw _privateConstructorUsedError;
  List<Unit> get unit => throw _privateConstructorUsedError;
  String? get selectedIcon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateProductStateCopyWith<CreateProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProductStateCopyWith<$Res> {
  factory $CreateProductStateCopyWith(
          CreateProductState value, $Res Function(CreateProductState) then) =
      _$CreateProductStateCopyWithImpl<$Res, CreateProductState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      String? error,
      XFile? pickedImage,
      List<String> listIcon,
      List<CategoryProduct> category,
      List<Brand> brand,
      List<Unit> unit,
      String? selectedIcon});
}

/// @nodoc
class _$CreateProductStateCopyWithImpl<$Res, $Val extends CreateProductState>
    implements $CreateProductStateCopyWith<$Res> {
  _$CreateProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? pickedImage = freezed,
    Object? listIcon = null,
    Object? category = null,
    Object? brand = null,
    Object? unit = null,
    Object? selectedIcon = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      pickedImage: freezed == pickedImage
          ? _value.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      listIcon: null == listIcon
          ? _value.listIcon
          : listIcon // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CategoryProduct>,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as List<Unit>,
      selectedIcon: freezed == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateProductStateImplCopyWith<$Res>
    implements $CreateProductStateCopyWith<$Res> {
  factory _$$CreateProductStateImplCopyWith(_$CreateProductStateImpl value,
          $Res Function(_$CreateProductStateImpl) then) =
      __$$CreateProductStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      String? error,
      XFile? pickedImage,
      List<String> listIcon,
      List<CategoryProduct> category,
      List<Brand> brand,
      List<Unit> unit,
      String? selectedIcon});
}

/// @nodoc
class __$$CreateProductStateImplCopyWithImpl<$Res>
    extends _$CreateProductStateCopyWithImpl<$Res, _$CreateProductStateImpl>
    implements _$$CreateProductStateImplCopyWith<$Res> {
  __$$CreateProductStateImplCopyWithImpl(_$CreateProductStateImpl _value,
      $Res Function(_$CreateProductStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? pickedImage = freezed,
    Object? listIcon = null,
    Object? category = null,
    Object? brand = null,
    Object? unit = null,
    Object? selectedIcon = freezed,
  }) {
    return _then(_$CreateProductStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      pickedImage: freezed == pickedImage
          ? _value.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      listIcon: null == listIcon
          ? _value._listIcon
          : listIcon // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CategoryProduct>,
      brand: null == brand
          ? _value._brand
          : brand // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      unit: null == unit
          ? _value._unit
          : unit // ignore: cast_nullable_to_non_nullable
              as List<Unit>,
      selectedIcon: freezed == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateProductStateImpl implements _CreateProductState {
  const _$CreateProductStateImpl(
      {this.status = DataStateStatus.initial,
      this.error,
      this.pickedImage,
      final List<String> listIcon = const [],
      final List<CategoryProduct> category = const [],
      final List<Brand> brand = const [],
      final List<Unit> unit = const [],
      this.selectedIcon})
      : _listIcon = listIcon,
        _category = category,
        _brand = brand,
        _unit = unit;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? error;
  @override
  final XFile? pickedImage;
  final List<String> _listIcon;
  @override
  @JsonKey()
  List<String> get listIcon {
    if (_listIcon is EqualUnmodifiableListView) return _listIcon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listIcon);
  }

  final List<CategoryProduct> _category;
  @override
  @JsonKey()
  List<CategoryProduct> get category {
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_category);
  }

  final List<Brand> _brand;
  @override
  @JsonKey()
  List<Brand> get brand {
    if (_brand is EqualUnmodifiableListView) return _brand;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brand);
  }

  final List<Unit> _unit;
  @override
  @JsonKey()
  List<Unit> get unit {
    if (_unit is EqualUnmodifiableListView) return _unit;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unit);
  }

  @override
  final String? selectedIcon;

  @override
  String toString() {
    return 'CreateProductState(status: $status, error: $error, pickedImage: $pickedImage, listIcon: $listIcon, category: $category, brand: $brand, unit: $unit, selectedIcon: $selectedIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateProductStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.pickedImage, pickedImage) ||
                other.pickedImage == pickedImage) &&
            const DeepCollectionEquality().equals(other._listIcon, _listIcon) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            const DeepCollectionEquality().equals(other._brand, _brand) &&
            const DeepCollectionEquality().equals(other._unit, _unit) &&
            (identical(other.selectedIcon, selectedIcon) ||
                other.selectedIcon == selectedIcon));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      error,
      pickedImage,
      const DeepCollectionEquality().hash(_listIcon),
      const DeepCollectionEquality().hash(_category),
      const DeepCollectionEquality().hash(_brand),
      const DeepCollectionEquality().hash(_unit),
      selectedIcon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateProductStateImplCopyWith<_$CreateProductStateImpl> get copyWith =>
      __$$CreateProductStateImplCopyWithImpl<_$CreateProductStateImpl>(
          this, _$identity);
}

abstract class _CreateProductState implements CreateProductState {
  const factory _CreateProductState(
      {final DataStateStatus status,
      final String? error,
      final XFile? pickedImage,
      final List<String> listIcon,
      final List<CategoryProduct> category,
      final List<Brand> brand,
      final List<Unit> unit,
      final String? selectedIcon}) = _$CreateProductStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get error;
  @override
  XFile? get pickedImage;
  @override
  List<String> get listIcon;
  @override
  List<CategoryProduct> get category;
  @override
  List<Brand> get brand;
  @override
  List<Unit> get unit;
  @override
  String? get selectedIcon;
  @override
  @JsonKey(ignore: true)
  _$$CreateProductStateImplCopyWith<_$CreateProductStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
