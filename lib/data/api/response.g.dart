// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      status: json['status'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

ApiResponse<T> _$ApiResponseFromJson<T>(Map<String, dynamic> json) =>
    ApiResponse<T>(
      status: json['status'] as int,
      message: json['message'] as String,
      data: _$JsonConverterFromJson<Object, T>(
          json['data'], Converter<T?>().fromJson),
    );

Map<String, dynamic> _$ApiResponseToJson<T>(ApiResponse<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': _$JsonConverterToJson<Object, T>(
          instance.data, Converter<T?>().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

ApiResponseList<T> _$ApiResponseListFromJson<T>(Map<String, dynamic> json) =>
    ApiResponseList<T>(
      status: json['status'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Converter<T>().fromJson(e as Object))
              .toList() ??
          const [],
      totalData: json['total_data'] as int? ?? 10,
      totalPage: json['total_page'] as int? ?? 1,
    );

Map<String, dynamic> _$ApiResponseListToJson<T>(ApiResponseList<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map(Converter<T>().toJson).toList(),
      'total_data': instance.totalData,
      'total_page': instance.totalPage,
    };
