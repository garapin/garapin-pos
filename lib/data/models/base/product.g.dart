// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      sku: json['sku'] as String?,
      image: json['image'] as String?,
      icon: json['icon'] as String?,
      discount: json['discount'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      brandRef: json['brand_ref'] == null
          ? null
          : BrandRef.fromJson(json['brand_ref'] as Map<String, dynamic>),
      categoryRef: json['category_ref'] == null
          ? null
          : CategoryRef.fromJson(json['category_ref'] as Map<String, dynamic>),
      unitRef: json['unit_ref'] == null
          ? null
          : UnitRef.fromJson(json['unit_ref'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'image': instance.image,
      'icon': instance.icon,
      'discount': instance.discount,
      'price': instance.price,
      'brand_ref': instance.brandRef,
      'category_ref': instance.categoryRef,
      'unit_ref': instance.unitRef,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

BrandRef _$BrandRefFromJson(Map<String, dynamic> json) => BrandRef(
      id: json['_id'] as String?,
      brand: json['brand'] as String?,
      production: json['production'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$BrandRefToJson(BrandRef instance) => <String, dynamic>{
      '_id': instance.id,
      'brand': instance.brand,
      'production': instance.production,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

CategoryRef _$CategoryRefFromJson(Map<String, dynamic> json) => CategoryRef(
      id: json['_id'] as String?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$CategoryRefToJson(CategoryRef instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'category': instance.category,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

UnitRef _$UnitRefFromJson(Map<String, dynamic> json) => UnitRef(
      id: json['_id'] as String?,
      unit: json['unit'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$UnitRefToJson(UnitRef instance) => <String, dynamic>{
      '_id': instance.id,
      'unit': instance.unit,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
