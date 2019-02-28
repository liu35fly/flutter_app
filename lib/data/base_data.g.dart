// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseData _$BaseDataFromJson(Map<String, dynamic> json) {
  return BaseData(json['code'] as int, json['data'], json['msg'] as String);
}

Map<String, dynamic> _$BaseDataToJson(BaseData instance) => <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg
    };
