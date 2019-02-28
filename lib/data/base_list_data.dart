import 'package:json_annotation/json_annotation.dart';

part 'base_list_data.g.dart';

@JsonSerializable()
class BaseListData {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  List<dynamic> data;

  @JsonKey(name: 'msg')
  String msg;

  BaseListData(
    this.code,
    this.data,
    this.msg,
  );

  factory BaseListData.fromJson(Map<String, dynamic> srcJson) =>
      _$BaseListDataFromJson(srcJson);
}
