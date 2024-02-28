// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoices _$InvoicesFromJson(Map<String, dynamic> json) => Invoices(
      product: json['product'] == null
          ? null
          : InvoicesProduct.fromJson(json['product'] as Map<String, dynamic>),
      invoice: json['invoice'] as String?,
      status: json['status'] as String?,
      paymentMethod: json['payment_method'],
      paymentDate: json['payment_date'],
      webhook: json['webhook'],
      id: json['_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$InvoicesToJson(Invoices instance) => <String, dynamic>{
      'product': instance.product,
      'invoice': instance.invoice,
      'status': instance.status,
      'payment_method': instance.paymentMethod,
      'payment_date': instance.paymentDate,
      'webhook': instance.webhook,
      '_id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

InvoicesProduct _$InvoicesProductFromJson(Map<String, dynamic> json) =>
    InvoicesProduct(
      id: json['_id'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: json['total_price'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$InvoicesProductToJson(InvoicesProduct instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'items': instance.items,
      'total_price': instance.totalPrice,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'user': instance.user,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      product: json['product'] == null
          ? null
          : ItemProduct.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      '_id': instance.id,
    };

ItemProduct _$ItemProductFromJson(Map<String, dynamic> json) => ItemProduct(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      sku: json['sku'] as String?,
      image: json['image'] as String?,
      icon: json['icon'] as String?,
      discount: json['discount'] as int?,
      price: json['price'] as int?,
      status: json['status'] as String?,
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

Map<String, dynamic> _$ItemProductToJson(ItemProduct instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'image': instance.image,
      'icon': instance.icon,
      'discount': instance.discount,
      'price': instance.price,
      'status': instance.status,
      'brand_ref': instance.brandRef,
      'category_ref': instance.categoryRef,
      'unit_ref': instance.unitRef,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
