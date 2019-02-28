import 'package:json_annotation/json_annotation.dart';

part 'book_shelf_top_data.g.dart';

List<BookShelfTopData> getBookShelfTopDataList(List<dynamic> list) {
  List<BookShelfTopData> result = [];
  list.forEach((item) {
    result.add(BookShelfTopData.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class BookShelfTopData {
  @JsonKey(name: 'bookId')
  int bookId;
  @JsonKey(name: 'bookIconUrl')
  String bookIconUrl;
  @JsonKey(name: 'bookName')
  String bookName;
  @JsonKey(name: 'bookContenUrl')
  String bookContenUrl;
  @JsonKey(name: 'bookAuthor')
  String bookAuthor;
  @JsonKey(name: 'bookNum')
  int bookNum;
  @JsonKey(name: 'bookType')
  String bookType;
  @JsonKey(name: 'status')
  int status;
  @JsonKey(name: 'oldBookId')
  int oldBookId;

  BookShelfTopData(
    this.bookId,
    this.bookIconUrl,
    this.bookName,
    this.bookContenUrl,
    this.bookAuthor,
    this.bookNum,
    this.bookType,
    this.status,
    this.oldBookId,
  );

  factory BookShelfTopData.fromJson(Map<String, dynamic> srcJson) =>
      _$BookShelfTopDataFromJson(srcJson);
}
