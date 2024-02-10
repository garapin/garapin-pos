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
  Store? get store => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  String? get selectCategory => throw _privateConstructorUsedError;
  List<CategoryProduct> get category => throw _privateConstructorUsedError;
  List<Product> get product => throw _privateConstructorUsedError;

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
      Store? store,
      String? search,
      String? selectCategory,
      List<CategoryProduct> category,
      List<Product> product});
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
    Object? store = freezed,
    Object? search = freezed,
    Object? selectCategory = freezed,
    Object? category = null,
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      selectCategory: freezed == selectCategory
          ? _value.selectCategory
          : selectCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CategoryProduct>,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as List<Product>,
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
      Store? store,
      String? search,
      String? selectCategory,
      List<CategoryProduct> category,
      List<Product> product});
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
    Object? store = freezed,
    Object? search = freezed,
    Object? selectCategory = freezed,
    Object? category = null,
    Object? product = null,
  }) {
    return _then(_$CatalogStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      selectCategory: freezed == selectCategory
          ? _value.selectCategory
          : selectCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CategoryProduct>,
      product: null == product
          ? _value._product
          : product // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$CatalogStateImpl implements _CatalogState {
  const _$CatalogStateImpl(
      {this.status = DataStateStatus.initial,
      this.store,
      this.search,
      this.selectCategory,
      final List<CategoryProduct> category = const [],
      final List<Product> product = const []})
      : _category = category,
        _product = product;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final Store? store;
  @override
  final String? search;
  @override
  final String? selectCategory;
  final List<CategoryProduct> _category;
  @override
  @JsonKey()
  List<CategoryProduct> get category {
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_category);
  }

  final List<Product> _product;
  @override
  @JsonKey()
  List<Product> get product {
    if (_product is EqualUnmodifiableListView) return _product;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_product);
  }

  @override
  String toString() {
    return 'CatalogState(status: $status, store: $store, search: $search, selectCategory: $selectCategory, category: $category, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.selectCategory, selectCategory) ||
                other.selectCategory == selectCategory) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            const DeepCollectionEquality().equals(other._product, _product));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      store,
      search,
      selectCategory,
      const DeepCollectionEquality().hash(_category),
      const DeepCollectionEquality().hash(_product));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogStateImplCopyWith<_$CatalogStateImpl> get copyWith =>
      __$$CatalogStateImplCopyWithImpl<_$CatalogStateImpl>(this, _$identity);
}

abstract class _CatalogState implements CatalogState {
  const factory _CatalogState(
      {final DataStateStatus status,
      final Store? store,
      final String? search,
      final String? selectCategory,
      final List<CategoryProduct> category,
      final List<Product> product}) = _$CatalogStateImpl;

  @override
  DataStateStatus get status;
  @override
  Store? get store;
  @override
  String? get search;
  @override
  String? get selectCategory;
  @override
  List<CategoryProduct> get category;
  @override
  List<Product> get product;
  @override
  @JsonKey(ignore: true)
  _$$CatalogStateImplCopyWith<_$CatalogStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
