// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_cash.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentCash _$PaymentCashFromJson(Map<String, dynamic> json) => PaymentCash(
      invoice: json['invoice'] == null
          ? null
          : Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
      refund: json['refund'] as int?,
    );

Map<String, dynamic> _$PaymentCashToJson(PaymentCash instance) =>
    <String, dynamic>{
      'invoice': instance.invoice,
      'refund': instance.refund,
    };

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      id: json['_id'] as String?,
      product: json['product'] == null
          ? null
          : InvoiceProduct.fromJson(json['product'] as Map<String, dynamic>),
      invoice: json['invoice'] as String?,
      invoiceLabel: json['invoice_label'] as String?,
      status: json['status'] as String?,
      paymentMethod: json['payment_method'] as String?,
      paymentDate: json['payment_date'] == null
          ? null
          : DateTime.parse(json['payment_date'] as String),
      webhook: json['webhook'] == null
          ? null
          : Webhook.fromJson(json['webhook'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      '_id': instance.id,
      'product': instance.product,
      'invoice': instance.invoice,
      'invoice_label': instance.invoiceLabel,
      'status': instance.status,
      'payment_method': instance.paymentMethod,
      'payment_date': instance.paymentDate?.toIso8601String(),
      'webhook': instance.webhook,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

InvoiceProduct _$InvoiceProductFromJson(Map<String, dynamic> json) =>
    InvoiceProduct(
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

Map<String, dynamic> _$InvoiceProductToJson(InvoiceProduct instance) =>
    <String, dynamic>{
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

Webhook _$WebhookFromJson(Map<String, dynamic> json) => Webhook(
      amountPaid: json['amount_paid'] as int?,
      totalPrice: json['total_price'] as int?,
      refund: json['refund'] as int?,
    );

Map<String, dynamic> _$WebhookToJson(Webhook instance) => <String, dynamic>{
      'amount_paid': instance.amountPaid,
      'total_price': instance.totalPrice,
      'refund': instance.refund,
    };
