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
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryTransactionToJson(HistoryTransaction instance) =>
    <String, dynamic>{
      'has_more': instance.hasMore,
      'data': instance.data,
      'links': instance.links,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as String?,
      productId: json['product_id'] as String?,
      type: $enumDecodeNullable(_$TypePaymentEnumMap, json['type']),
      status: $enumDecodeNullable(_$DatumStatusEnumMap, json['status']),
      channelCategory: $enumDecodeNullable(
          _$ChannelCategoryEnumMap, json['channel_category']),
      channelCode: json['channel_code'] as String?,
      referenceId: json['reference_id'] as String?,
      accountIdentifier: json['account_identifier'] as String?,
      currency: $enumDecodeNullable(_$CurrencyEnumMap, json['currency']),
      amount: json['amount'] as int?,
      netAmount: json['net_amount'] as int?,
      cashflow: $enumDecodeNullable(_$CashflowEnumMap, json['cashflow']),
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

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'type': _$TypePaymentEnumMap[instance.type],
      'status': _$DatumStatusEnumMap[instance.status],
      'channel_category': _$ChannelCategoryEnumMap[instance.channelCategory],
      'channel_code': instance.channelCode,
      'reference_id': instance.referenceId,
      'account_identifier': instance.accountIdentifier,
      'currency': _$CurrencyEnumMap[instance.currency],
      'amount': instance.amount,
      'net_amount': instance.netAmount,
      'cashflow': _$CashflowEnumMap[instance.cashflow],
      'settlement_status': instance.settlementStatus,
      'estimated_settlement_time':
          instance.estimatedSettlementTime?.toIso8601String(),
      'business_id': instance.businessId,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'fee': instance.fee,
    };

const _$TypePaymentEnumMap = {
  TypePayment.PAYMENT: 'PAYMENT',
  TypePayment.TRANSFER: 'TRANSFER',
  TypePayment.DISBURSEMENT: 'DISBURSEMENT',
};

const _$DatumStatusEnumMap = {
  DatumStatus.SUCCESS: 'SUCCESS',
  DatumStatus.PENDING: 'PENDING',
};

const _$ChannelCategoryEnumMap = {
  ChannelCategory.QR_CODE: 'QR_CODE',
  ChannelCategory.BANK: 'BANK',
  ChannelCategory.EWALLET: 'EWALLET',
  ChannelCategory.VIRTUAL_ACCOUNT: 'VIRTUAL_ACCOUNT',
  ChannelCategory.XENPLATFORM: 'XENPLATFORM',
};

const _$CurrencyEnumMap = {
  Currency.IDR: 'IDR',
};

const _$CashflowEnumMap = {
  Cashflow.MONEY_IN: 'MONEY_IN',
  Cashflow.MONEY_OUT: 'MONEY_OUT',
};

Fee _$FeeFromJson(Map<String, dynamic> json) => Fee(
      xenditFee: json['xendit_fee'] as int?,
      valueAddedTax: json['value_added_tax'] as int?,
      xenditWithholdingTax: json['xendit_withholding_tax'] as int?,
      thirdPartyWithholdingTax: json['third_party_withholding_tax'] as int?,
      status: $enumDecodeNullable(_$FeeStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$FeeToJson(Fee instance) => <String, dynamic>{
      'xendit_fee': instance.xenditFee,
      'value_added_tax': instance.valueAddedTax,
      'xendit_withholding_tax': instance.xenditWithholdingTax,
      'third_party_withholding_tax': instance.thirdPartyWithholdingTax,
      'status': _$FeeStatusEnumMap[instance.status],
    };

const _$FeeStatusEnumMap = {
  FeeStatus.COMPLETED: 'COMPLETED',
  FeeStatus.PENDING: 'PENDING',
};

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      href: json['href'] as String?,
      method: json['method'] as String?,
      rel: json['rel'] as String?,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'href': instance.href,
      'method': instance.method,
      'rel': instance.rel,
    };
