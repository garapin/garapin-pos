// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryTransaction _$HistoryTransactionFromJson(Map<String, dynamic> json) =>
    HistoryTransaction(
      hasMore: json['has_more'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] as String?,
    );

Map<String, dynamic> _$HistoryTransactionToJson(HistoryTransaction instance) =>
    <String, dynamic>{
      'has_more': instance.hasMore,
      'data': instance.data,
      'links': instance.links,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      transaction: json['transaction'] == null
          ? null
          : Transaction.fromJson(json['transaction'] as Map<String, dynamic>),
      splitPayment: json['splitPayment'] == null
          ? null
          : SplitPayment.fromJson(json['splitPayment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'transaction': instance.transaction,
      'splitPayment': instance.splitPayment,
    };

SplitPayment _$SplitPaymentFromJson(Map<String, dynamic> json) => SplitPayment(
      id: json['_id'] as String?,
      idTemplate: json['id_template'] as String?,
      invoice: json['invoice'] as String?,
      splitPaymentId: json['id'] as String?,
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

Map<String, dynamic> _$SplitPaymentToJson(SplitPayment instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'id_template': instance.idTemplate,
      'invoice': instance.invoice,
      'id': instance.splitPaymentId,
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
      flatAmount: json['flat_amount'] as int?,
      target: json['target'] as String?,
      role: json['role'] as String?,
      fee: json['fee'] as int?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'currency': instance.currency,
      'destination_account_id': instance.destinationAccountId,
      'reference_id': instance.referenceId,
      'flat_amount': instance.flatAmount,
      'target': instance.target,
      'role': instance.role,
      'fee': instance.fee,
      '_id': instance.id,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
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

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
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
