// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      id: json['_id'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] as String?,
      totalPrice: json['total_price'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      '_id': instance.id,
      'items': instance.items,
      'user': instance.user,
      'total_price': instance.totalPrice,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      product: json['product'] == null
          ? null
          : ProductCart.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      '_id': instance.id,
    };

ProductCart _$ProductCartFromJson(Map<String, dynamic> json) => ProductCart(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      sku: json['sku'] as String?,
      image: json['image'] as String?,
      icon: json['icon'] as String?,
      discount: json['discount'] as int?,
      price: json['price'] as int?,
      brandRef: json['brand_ref'] as String?,
      categoryRef: json['category_ref'] as String?,
      unitRef: json['unit_ref'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$ProductCartToJson(ProductCart instance) =>
    <String, dynamic>{
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
