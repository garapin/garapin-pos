// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqProduct _$ReqProductFromJson(Map<String, dynamic> json) => ReqProduct(
      name: json['name'] as String?,
      sku: json['sku'] as String?,
      brandRef: json['brand_ref'] as String?,
      categoryRef: json['category_ref'] as String?,
      unitRef: json['unit_ref'] as String?,
      discount: json['discount'] as int?,
      price: json['price'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ReqProductToJson(ReqProduct instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sku': instance.sku,
      'brand_ref': instance.brandRef,
      'category_ref': instance.categoryRef,
      'unit_ref': instance.unitRef,
      'discount': instance.discount,
      'price': instance.price,
      'image': instance.image,
    };
