// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'split_payment_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplitPaymentRule _$SplitPaymentRuleFromJson(Map<String, dynamic> json) =>
    SplitPaymentRule(
      name: json['name'] as String?,
      description: json['description'] as String?,
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => RoutePayments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SplitPaymentRuleToJson(SplitPaymentRule instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'routes': instance.routes,
    };

RoutePayments _$RoutePaymentsFromJson(Map<String, dynamic> json) =>
    RoutePayments(
      type: json['type'] as String?,
      target: json['target'] as String?,
      feePos: json['fee_pos'] as int?,
      flatAmount: json['flat_amount'] as int?,
      percentAmount: json['percent_amount'] as int?,
      currency: json['currency'] as String?,
      destinationAccountId: json['destination_account_id'] as String?,
      referenceId: json['reference_id'] as String?,
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
    };
