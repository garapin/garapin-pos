// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'split_payment_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplitPaymentDetail _$SplitPaymentDetailFromJson(Map<String, dynamic> json) =>
    SplitPaymentDetail(
      split: json['split'] == null
          ? null
          : Split.fromJson(json['split'] as Map<String, dynamic>),
      template: json['template'] == null
          ? null
          : Template.fromJson(json['template'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SplitPaymentDetailToJson(SplitPaymentDetail instance) =>
    <String, dynamic>{
      'split': instance.split,
      'template': instance.template,
    };

Split _$SplitFromJson(Map<String, dynamic> json) => Split(
      id: json['_id'] as String?,
      idTemplate: json['id_template'] as String?,
      invoice: json['invoice'] as String?,
      splitId: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => SplitRoute.fromJson(e as Map<String, dynamic>))
          .toList(),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$SplitToJson(Split instance) => <String, dynamic>{
      '_id': instance.id,
      'id_template': instance.idTemplate,
      'invoice': instance.invoice,
      'id': instance.splitId,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'routes': instance.routes,
      '__v': instance.v,
    };

SplitRoute _$SplitRouteFromJson(Map<String, dynamic> json) => SplitRoute(
      currency: json['currency'] as String?,
      destinationAccountId: json['destination_account_id'] as String?,
      referenceId: json['reference_id'] as String?,
      flatAmount: json['flat_amount'] as int?,
      id: json['_id'] as String?,
    )
      ..role = json['role'] as String?
      ..target = json['target'] as String?
      ..fee = json['fee'] as int?;

Map<String, dynamic> _$SplitRouteToJson(SplitRoute instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'destination_account_id': instance.destinationAccountId,
      'reference_id': instance.referenceId,
      'flat_amount': instance.flatAmount,
      'role': instance.role,
      'target': instance.target,
      'fee': instance.fee,
      '_id': instance.id,
    };

Template _$TemplateFromJson(Map<String, dynamic> json) => Template(
      id: json['_id'] as String?,
      statusTemplate: json['status_template'] as String?,
      name: json['name'] as String?,
      description: json['description'],
      dbTrx: json['db_trx'] as String?,
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => TemplateRoute.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$TemplateToJson(Template instance) => <String, dynamic>{
      '_id': instance.id,
      'status_template': instance.statusTemplate,
      'name': instance.name,
      'description': instance.description,
      'db_trx': instance.dbTrx,
      'routes': instance.routes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

TemplateRoute _$TemplateRouteFromJson(Map<String, dynamic> json) =>
    TemplateRoute(
      type: json['type'] as String?,
      target: json['target'] as String?,
      feePos: json['fee_pos'] as int?,
      flatAmount: json['flat_amount'],
      percentAmount: json['percent_amount'] as int?,
      currency: json['currency'] as String?,
      destinationAccountId: json['destination_account_id'] as String?,
      referenceId: json['reference_id'] as String?,
      id: json['_id'],
    );

Map<String, dynamic> _$TemplateRouteToJson(TemplateRoute instance) =>
    <String, dynamic>{
      'type': instance.type,
      'target': instance.target,
      'fee_pos': instance.feePos,
      'flat_amount': instance.flatAmount,
      'percent_amount': instance.percentAmount,
      'currency': instance.currency,
      'destination_account_id': instance.destinationAccountId,
      'reference_id': instance.referenceId,
      '_id': instance.id,
    };
