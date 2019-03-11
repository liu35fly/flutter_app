import 'package:json_annotation/json_annotation.dart';

part 'book_class_data.g.dart';

List<BookClassData> getBookClassDataList(List<dynamic> list) {
  List<BookClassData> result = [];
  list.forEach((item) {
    result.add(BookClassData.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class BookClassData{

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'icons')
  List<String> icons;

  BookClassData(this.id, this.name, this.icons);

  factory BookClassData.fromJson(Map<String, dynamic> srcJson) =>
      _$BookClassDataFromJson(srcJson);
}