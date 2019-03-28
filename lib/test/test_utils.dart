import 'package:flutter_app/data/book_shelf_top_data.dart';
import 'package:flutter_app/data/book_store/banner_data.dart';

class TestUtils {
  BookShelfTopData createShelfData() {
    return BookShelfTopData(
        15,
        "http://bookapp.dtbooking.com//image/%E5%A5%B9%E6%AF%94%E7%83%9F%E8%8A%B1%E8%BF%98%E8%80%80%E7%9C%BC.jpg",
        "测试书籍",
        "",
        "无名氏",
        18,
        "",
        0,
        115);
  }

  List<BannerData> createBannerDatas() {
    List<BannerData> list = new List();
    for (var i = 0; i < 3; i++) {
      list.add(BannerData(
          i,
          "http://cc.a0d11.com/uploads/banner/20190118/77b79d0becc89d9905ebd0ad19287c0e.jpg",
          i));
    }
    return list;
  }
}
