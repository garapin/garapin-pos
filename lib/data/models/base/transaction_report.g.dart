// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionReport _$TransactionReportFromJson(Map<String, dynamic> json) =>
    TransactionReport(
      hasMore: json['has_more'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => TransactionReportData.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] as String?,
    );

Map<String, dynamic> _$TransactionReportToJson(TransactionReport instance) =>
    <String, dynamic>{
      'has_more': instance.hasMore,
      'data': instance.data,
      'links': instance.links,
    };

TransactionReportData _$TransactionReportDataFromJson(
        Map<String, dynamic> json) =>
    TransactionReportData(
      id: json['id'] as String?,
      productId: json['product_id'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      channelCategory: json['channel_category'] as String?,
      channelCode: json['channel_code'] as String?,
      referenceId: json['reference_id'] as String?,
      accountIdentifier: json['account_identifier'],
      currency: json['currency'] as String?,
      amount: json['amount'] as int?,
      netAmount: json['net_amount'] as int?,
      cashflow: json['cashflow'] as String?,
      settlementStatus: json['settlement_status'] as String?,
      estimatedSettlementTime: json['estimated_settlement_time'] == null
          ? null
          : DateTime.parse(json['estimated_settlement_time'] as String),
      businessId: json['business_id'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      fee: json['fee'] == null
          ? null
          : Fee.fromJson(json['fee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionReportDataToJson(
        TransactionReportData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'type': instance.type,
      'status': instance.status,
      'channel_category': instance.channelCategory,
      'channel_code': instance.channelCode,
      'reference_id': instance.referenceId,
      'account_identifier': instance.accountIdentifier,
      'currency': instance.currency,
      'amount': instance.amount,
      'net_amount': instance.netAmount,
      'cashflow': instance.cashflow,
      'settlement_status': instance.settlementStatus,
      'estimated_settlement_time':
          instance.estimatedSettlementTime?.toIso8601String(),
      'business_id': instance.businessId,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'fee': instance.fee,
    };

Fee _$FeeFromJson(Map<String, dynamic> json) => Fee(
      xenditFee: json['xendit_fee'] as int?,
      valueAddedTax: json['value_added_tax'] as int?,
      xenditWithholdingTax: json['xendit_withholding_tax'] as int?,
      thirdPartyWithholdingTax: json['third_party_withholding_tax'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$FeeToJson(Fee instance) => <String, dynamic>{
      'xendit_fee': instance.xenditFee,
      'value_added_tax': instance.valueAddedTax,
      'xendit_withholding_tax': instance.xenditWithholdingTax,
      'third_party_withholding_tax': instance.thirdPartyWithholdingTax,
      'status': instance.status,
    };
