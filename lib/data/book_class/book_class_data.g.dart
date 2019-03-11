// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_class_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookClassData _$BookClassDataFromJson(Map<String, dynamic> json) {
  return BookClassData(json['id'] as int, json['name'] as String,
      (json['iconList'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$BookClassDataToJson(BookClassData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconList': instance.iconList
    };
