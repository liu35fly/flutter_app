// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerData _$BannerDataFromJson(Map<String, dynamic> json) {
  return BannerData(
      json['id'] as int, json['iconUrl'] as String, json['type'] as int);
}

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iconUrl': instance.iconUrl,
      'type': instance.type
    };
