import 'package:json_annotation/json_annotation.dart';

part 'banner_data.g.dart';

@JsonSerializable()
class BannerData {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'iconUrl')
  String iconUrl;
  @JsonKey(name: 'type')
  int type;

  BannerData(this.id, this.iconUrl, this.type);

  factory BannerData.fromJson(Map<String, dynamic> srcJson) =>
      _$BannerDataFromJson(srcJson);
}
