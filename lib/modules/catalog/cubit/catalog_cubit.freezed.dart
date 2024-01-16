// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CatalogState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;
  List<Product> get catalog => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  String get statusProduct => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  bool get showGrid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CatalogStateCopyWith<CatalogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogStateCopyWith<$Res> {
  factory $CatalogStateCopyWith(
          CatalogState value, $Res Function(CatalogState) then) =
      _$CatalogStateCopyWithImpl<$Res, CatalogState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      String? err,
      List<Product> catalog,
      int page,
      String statusProduct,
      bool canLoadMore,
      bool showGrid});
}

/// @nodoc
class _$CatalogStateCopyWithImpl<$Res, $Val extends CatalogState>
    implements $CatalogStateCopyWith<$Res> {
  _$CatalogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? catalog = null,
    Object? page = null,
    Object? statusProduct = null,
    Object? canLoadMore = null,
    Object? showGrid = null,
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
      catalog: null == catalog
          ? _value.catalog
          : catalog // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      statusProduct: null == statusProduct
          ? _value.statusProduct
          : statusProduct // ignore: cast_nullable_to_non_nullable
              as String,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      showGrid: null == showGrid
          ? _value.showGrid
          : showGrid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CatalogStateImplCopyWith<$Res>
    implements $CatalogStateCopyWith<$Res> {
  factory _$$CatalogStateImplCopyWith(
          _$CatalogStateImpl value, $Res Function(_$CatalogStateImpl) then) =
      __$$CatalogStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      String? err,
      List<Product> catalog,
      int page,
      String statusProduct,
      bool canLoadMore,
      bool showGrid});
}

/// @nodoc
class __$$CatalogStateImplCopyWithImpl<$Res>
    extends _$CatalogStateCopyWithImpl<$Res, _$CatalogStateImpl>
    implements _$$CatalogStateImplCopyWith<$Res> {
  __$$CatalogStateImplCopyWithImpl(
      _$CatalogStateImpl _value, $Res Function(_$CatalogStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? catalog = null,
    Object? page = null,
    Object? statusProduct = null,
    Object? canLoadMore = null,
    Object? showGrid = null,
  }) {
    return _then(_$CatalogStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      catalog: null == catalog
          ? _value._catalog
          : catalog // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      statusProduct: null == statusProduct
          ? _value.statusProduct
          : statusProduct // ignore: cast_nullable_to_non_nullable
              as String,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      showGrid: null == showGrid
          ? _value.showGrid
          : showGrid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CatalogStateImpl implements _CatalogState {
  const _$CatalogStateImpl(
      {this.status = DataStateStatus.initial,
      this.err,
      final List<Product> catalog = const [],
      this.page = 1,
      this.statusProduct = "AKTIF",
      this.canLoadMore = false,
      this.showGrid = false})
      : _catalog = catalog;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? err;
  final List<Product> _catalog;
  @override
  @JsonKey()
  List<Product> get catalog {
    if (_catalog is EqualUnmodifiableListView) return _catalog;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_catalog);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final String statusProduct;
  @override
  @JsonKey()
  final bool canLoadMore;
  @override
  @JsonKey()
  final bool showGrid;

  @override
  String toString() {
    return 'CatalogState(status: $status, err: $err, catalog: $catalog, page: $page, statusProduct: $statusProduct, canLoadMore: $canLoadMore, showGrid: $showGrid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.err, err) || other.err == err) &&
            const DeepCollectionEquality().equals(other._catalog, _catalog) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.statusProduct, statusProduct) ||
                other.statusProduct == statusProduct) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.showGrid, showGrid) ||
                other.showGrid == showGrid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      err,
      const DeepCollectionEquality().hash(_catalog),
      page,
      statusProduct,
      canLoadMore,
      showGrid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogStateImplCopyWith<_$CatalogStateImpl> get copyWith =>
      __$$CatalogStateImplCopyWithImpl<_$CatalogStateImpl>(this, _$identity);
}

abstract class _CatalogState implements CatalogState {
  const factory _CatalogState(
      {final DataStateStatus status,
      final String? err,
      final List<Product> catalog,
      final int page,
      final String statusProduct,
      final bool canLoadMore,
      final bool showGrid}) = _$CatalogStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get err;
  @override
  List<Product> get catalog;
  @override
  int get page;
  @override
  String get statusProduct;
  @override
  bool get canLoadMore;
  @override
  bool get showGrid;
  @override
  @JsonKey(ignore: true)
  _$$CatalogStateImplCopyWith<_$CatalogStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
