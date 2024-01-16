// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddProductState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get noProduct => throw _privateConstructorUsedError;
  String? get imei => throw _privateConstructorUsedError;
  String? get noSn => throw _privateConstructorUsedError;
  TypeScan? get typeScan => throw _privateConstructorUsedError;
  List<Product> get filterCatalog => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddProductStateCopyWith<AddProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProductStateCopyWith<$Res> {
  factory $AddProductStateCopyWith(
          AddProductState value, $Res Function(AddProductState) then) =
      _$AddProductStateCopyWithImpl<$Res, AddProductState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      String? error,
      String? noProduct,
      String? imei,
      String? noSn,
      TypeScan? typeScan,
      List<Product> filterCatalog});
}

/// @nodoc
class _$AddProductStateCopyWithImpl<$Res, $Val extends AddProductState>
    implements $AddProductStateCopyWith<$Res> {
  _$AddProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? noProduct = freezed,
    Object? imei = freezed,
    Object? noSn = freezed,
    Object? typeScan = freezed,
    Object? filterCatalog = null,
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
      noProduct: freezed == noProduct
          ? _value.noProduct
          : noProduct // ignore: cast_nullable_to_non_nullable
              as String?,
      imei: freezed == imei
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as String?,
      noSn: freezed == noSn
          ? _value.noSn
          : noSn // ignore: cast_nullable_to_non_nullable
              as String?,
      typeScan: freezed == typeScan
          ? _value.typeScan
          : typeScan // ignore: cast_nullable_to_non_nullable
              as TypeScan?,
      filterCatalog: null == filterCatalog
          ? _value.filterCatalog
          : filterCatalog // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddProductStateImplCopyWith<$Res>
    implements $AddProductStateCopyWith<$Res> {
  factory _$$AddProductStateImplCopyWith(_$AddProductStateImpl value,
          $Res Function(_$AddProductStateImpl) then) =
      __$$AddProductStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      String? error,
      String? noProduct,
      String? imei,
      String? noSn,
      TypeScan? typeScan,
      List<Product> filterCatalog});
}

/// @nodoc
class __$$AddProductStateImplCopyWithImpl<$Res>
    extends _$AddProductStateCopyWithImpl<$Res, _$AddProductStateImpl>
    implements _$$AddProductStateImplCopyWith<$Res> {
  __$$AddProductStateImplCopyWithImpl(
      _$AddProductStateImpl _value, $Res Function(_$AddProductStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? noProduct = freezed,
    Object? imei = freezed,
    Object? noSn = freezed,
    Object? typeScan = freezed,
    Object? filterCatalog = null,
  }) {
    return _then(_$AddProductStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      noProduct: freezed == noProduct
          ? _value.noProduct
          : noProduct // ignore: cast_nullable_to_non_nullable
              as String?,
      imei: freezed == imei
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as String?,
      noSn: freezed == noSn
          ? _value.noSn
          : noSn // ignore: cast_nullable_to_non_nullable
              as String?,
      typeScan: freezed == typeScan
          ? _value.typeScan
          : typeScan // ignore: cast_nullable_to_non_nullable
              as TypeScan?,
      filterCatalog: null == filterCatalog
          ? _value._filterCatalog
          : filterCatalog // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$AddProductStateImpl implements _AddProductState {
  const _$AddProductStateImpl(
      {this.status = DataStateStatus.initial,
      this.error,
      this.noProduct,
      this.imei,
      this.noSn,
      this.typeScan,
      final List<Product> filterCatalog = const []})
      : _filterCatalog = filterCatalog;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? error;
  @override
  final String? noProduct;
  @override
  final String? imei;
  @override
  final String? noSn;
  @override
  final TypeScan? typeScan;
  final List<Product> _filterCatalog;
  @override
  @JsonKey()
  List<Product> get filterCatalog {
    if (_filterCatalog is EqualUnmodifiableListView) return _filterCatalog;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterCatalog);
  }

  @override
  String toString() {
    return 'AddProductState(status: $status, error: $error, noProduct: $noProduct, imei: $imei, noSn: $noSn, typeScan: $typeScan, filterCatalog: $filterCatalog)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.noProduct, noProduct) ||
                other.noProduct == noProduct) &&
            (identical(other.imei, imei) || other.imei == imei) &&
            (identical(other.noSn, noSn) || other.noSn == noSn) &&
            (identical(other.typeScan, typeScan) ||
                other.typeScan == typeScan) &&
            const DeepCollectionEquality()
                .equals(other._filterCatalog, _filterCatalog));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, noProduct, imei,
      noSn, typeScan, const DeepCollectionEquality().hash(_filterCatalog));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductStateImplCopyWith<_$AddProductStateImpl> get copyWith =>
      __$$AddProductStateImplCopyWithImpl<_$AddProductStateImpl>(
          this, _$identity);
}

abstract class _AddProductState implements AddProductState {
  const factory _AddProductState(
      {final DataStateStatus status,
      final String? error,
      final String? noProduct,
      final String? imei,
      final String? noSn,
      final TypeScan? typeScan,
      final List<Product> filterCatalog}) = _$AddProductStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get error;
  @override
  String? get noProduct;
  @override
  String? get imei;
  @override
  String? get noSn;
  @override
  TypeScan? get typeScan;
  @override
  List<Product> get filterCatalog;
  @override
  @JsonKey(ignore: true)
  _$$AddProductStateImplCopyWith<_$AddProductStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
