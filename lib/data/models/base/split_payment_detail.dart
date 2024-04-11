// To parse this JSON data, do
//
//     final splitPaymentDetail = splitPaymentDetailFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'split_payment_detail.g.dart';

@JsonSerializable()
class SplitPaymentDetail {
  @JsonKey(name: "split")
  Split? split;
  @JsonKey(name: "template")
  Template? template;

  SplitPaymentDetail({
    this.split,
    this.template,
  });

  factory SplitPaymentDetail.fromJson(Map<String, dynamic> json) =>
      _$SplitPaymentDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SplitPaymentDetailToJson(this);
}

@JsonSerializable()
class Split {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "id_template")
  String? idTemplate;
  @JsonKey(name: "invoice")
  String? invoice;
  @JsonKey(name: "id")
  String? splitId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "routes")
  List<SplitRoute>? routes;
  @JsonKey(name: "__v")
  int? v;

  Split({
    this.id,
    this.idTemplate,
    this.invoice,
    this.splitId,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.routes,
    this.v,
  });

  factory Split.fromJson(Map<String, dynamic> json) => _$SplitFromJson(json);

  Map<String, dynamic> toJson() => _$SplitToJson(this);
}

@JsonSerializable()
class SplitRoute {
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "destination_account_id")
  String? destinationAccountId;
  @JsonKey(name: "reference_id")
  String? referenceId;
  @JsonKey(name: "flat_amount")
  int? flatAmount;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "target")
  String? target;
  @JsonKey(name: "fee")
  int? fee;
  @JsonKey(name: "_id")
  String? id;

  SplitRoute({
    this.currency,
    this.destinationAccountId,
    this.referenceId,
    this.flatAmount,
    this.id,
  });

  factory SplitRoute.fromJson(Map<String, dynamic> json) =>
      _$SplitRouteFromJson(json);

  Map<String, dynamic> toJson() => _$SplitRouteToJson(this);
}

@JsonSerializable()
class Template {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "status_template")
  String? statusTemplate;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  dynamic description;
  @JsonKey(name: "db_trx")
  String? dbTrx;
  @JsonKey(name: "routes")
  List<TemplateRoute>? routes;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  Template({
    this.id,
    this.statusTemplate,
    this.name,
    this.description,
    this.dbTrx,
    this.routes,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateToJson(this);
}

@JsonSerializable()
class TemplateRoute {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "target")
  String? target;
  @JsonKey(name: "fee_pos")
  int? feePos;
  @JsonKey(name: "flat_amount")
  dynamic flatAmount;
  @JsonKey(name: "percent_amount")
  int? percentAmount;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "destination_account_id")
  String? destinationAccountId;
  @JsonKey(name: "reference_id")
  String? referenceId;
  @JsonKey(name: "_id")
  dynamic id;

  TemplateRoute({
    this.type,
    this.target,
    this.feePos,
    this.flatAmount,
    this.percentAmount,
    this.currency,
    this.destinationAccountId,
    this.referenceId,
    this.id,
  });

  factory TemplateRoute.fromJson(Map<String, dynamic> json) =>
      _$TemplateRouteFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateRouteToJson(this);
}
