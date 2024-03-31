import 'package:json_annotation/json_annotation.dart';
import '../../engine/helpers/constants.dart';
import '../../engine/helpers/converter.dart';

part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  final int status;
  final String message;

  bool get isSuccess => status == APIResult.success;

  BaseResponse({required this.status, required this.message});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

@JsonSerializable()
class ApiResponse<T> extends BaseResponse {
  @Converter()
  final T? data;
  @JsonKey(name: 'current_version')
  final String currentVersion;

  ApiResponse(
      {required super.status,
      required super.message,
      this.data,
      required this.currentVersion});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  factory ApiResponse.onError(BaseResponse error) => ApiResponse(
      status: error.status, message: error.message, currentVersion: '');
}

@JsonSerializable()
class ApiResponseList<T> extends BaseResponse {
  @Converter()
  final List<T> data;

  @JsonKey(name: 'total_data')
  final int totalData;
  @JsonKey(name: 'total_page')
  final int totalPage;
  @JsonKey(name: 'current_version')
  final String currentVersion;

  ApiResponseList(
      {required super.status,
      required super.message,
      this.data = const [],
      this.totalData = 10,
      this.totalPage = 1,
      required this.currentVersion});

  factory ApiResponseList.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResponseListToJson(this);

  factory ApiResponseList.onError(BaseResponse error) => ApiResponseList(
      status: error.status, message: error.message, currentVersion: "");
}
