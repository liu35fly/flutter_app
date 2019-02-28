// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_shelf_top_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookShelfTopData _$BookShelfTopDataFromJson(Map<String, dynamic> json) {
  return BookShelfTopData(
      json['bookId'] as int,
      json['bookIconUrl'] as String,
      json['bookName'] as String,
      json['bookContenUrl'] as String,
      json['bookAuthor'] as String,
      json['bookNum'] as int,
      json['bookType'] as String,
      json['status'] as int,
      json['oldBookId'] as int);
}

Map<String, dynamic> _$BookShelfTopDataToJson(BookShelfTopData instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'bookIconUrl': instance.bookIconUrl,
      'bookName': instance.bookName,
      'bookContenUrl': instance.bookContenUrl,
      'bookAuthor': instance.bookAuthor,
      'bookNum': instance.bookNum,
      'bookType': instance.bookType,
      'status': instance.status,
      'oldBookId': instance.oldBookId
    };
