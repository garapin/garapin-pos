// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'split_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplitRule _$SplitRuleFromJson(Map<String, dynamic> json) => SplitRule(
      id: json['_id'] as String?,
      idTemplate: json['id_template'] as String?,
      splitRuleId: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$SplitRuleToJson(SplitRule instance) => <String, dynamic>{
      '_id': instance.id,
      'id_template': instance.idTemplate,
      'id': instance.splitRuleId,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'routes': instance.routes,
      '__v': instance.v,
    };

Route _$RouteFromJson(Map<String, dynamic> json) => Route(
      currency: json['currency'] as String?,
      destinationAccountId: json['destination_account_id'] as String?,
      referenceId: json['reference_id'] as String?,
      percentAmount: (json['percent_amount'] as num?)?.toDouble(),
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'currency': instance.currency,
      'destination_account_id': instance.destinationAccountId,
      'reference_id': instance.referenceId,
      'percent_amount': instance.percentAmount,
      '_id': instance.id,
    };
