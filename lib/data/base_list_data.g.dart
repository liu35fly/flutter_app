// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListData _$BaseListDataFromJson(Map<String, dynamic> json) {
  return BaseListData(
      json['code'] as int, json['data'] as List, json['msg'] as String);
}

Map<String, dynamic> _$BaseListDataToJson(BaseListData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg
    };
