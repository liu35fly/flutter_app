import 'package:json_annotation/json_annotation.dart';

part 'base_data.g.dart';

@JsonSerializable()
class BaseData {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  dynamic data;

  @JsonKey(name: 'msg')
  String msg;

  BaseData(
    this.code,
    this.data,
    this.msg,
  );

  factory BaseData.fromJson(Map<String, dynamic> srcJson) =>
      _$BaseDataFromJson(srcJson);
}
