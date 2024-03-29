// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'split_payment_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplitPaymentTemplate _$SplitPaymentTemplateFromJson(
        Map<String, dynamic> json) =>
    SplitPaymentTemplate(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      statusTemplate: json['status_template'] as String?,
      description: json['description'],
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => RoutePayments.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    )..dbTrx = json['db_trx'] as String?;

Map<String, dynamic> _$SplitPaymentTemplateToJson(
        SplitPaymentTemplate instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'status_template': instance.statusTemplate,
      'db_trx': instance.dbTrx,
      'name': instance.name,
      'description': instance.description,
      'routes': instance.routes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

RoutePayments _$RoutePaymentsFromJson(Map<String, dynamic> json) =>
    RoutePayments(
      type: json['type'] as String?,
      target: json['target'] as String?,
      feePos: json['fee_pos'],
      flatAmount: json['flat_amount'],
      percentAmount: json['percent_amount'],
      currency: json['currency'],
      destinationAccountId: json['destination_account_id'],
      referenceId: json['reference_id'],
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$RoutePaymentsToJson(RoutePayments instance) =>
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
