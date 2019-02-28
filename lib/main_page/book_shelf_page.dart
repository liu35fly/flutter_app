import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

import 'package:flutter_app/data/book_shelf_top_data.dart';
import 'package:flutter_app/main_page/book_shelf/book_shelf_top_group.dart';

class BookShelfPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BookShelfPageState();
  }
}

class _BookShelfPageState extends State<BookShelfPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: new AppBar(
//        centerTitle: true,
//        title: new Text('书架'),
//      ),
//      body: GridView.count(
//        crossAxisCount: 3,
//        childAspectRatio: 0.7,
//        primary: false,
//        padding: const EdgeInsets.all(8.0),
//        mainAxisSpacing: 8.0,
//        crossAxisSpacing: 8.0,
//        children: buildGridTitleList(5),
//      ),
//    );
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text('书架'),
        ),
        body: BookShelfTopGroup());
  }

  Widget buildTopGroup(List<BookShelfTopData> list) {
    return Column(
      children: <Widget>[],
    );
  }

  Widget buildTopChildren(BookShelfTopData data) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Image.network(
            data.bookIconUrl,
            width: 54.0,
            height: 72.0,
          ),
          Text(data.bookName,
              style: TextStyle(
                fontSize: 13.0,
                color: Color(0xff333333),
              ))
        ],
      ),
    );
  }

  List<Widget> buildGridTitleList(int num) {
    List<Widget> widgetList = new List();
    for (int i = 0; i < num; i++) {
      widgetList.add(getItemWidget());
    }
    return widgetList;
  }

  String url =
      "http://bookapp.dtbooking.com//image/%E5%A5%B9%E6%AF%94%E7%83%9F%E8%8A%B1%E8%BF%98%E8%80%80%E7%9C%BC.jpg";

  Widget getItemWidget() {
    //BoxFit 可设置展示图片时 的填充方式
//    return new Image(image: new NetworkImage(url), fit: BoxFit.cover);
    return FadeInImage.memoryNetwork(
      image: url,
      placeholder: kTransparentImage,
      fit: BoxFit.contain,
    );
//    fadeInDuration: const Duration(seconds: 1)
  }
}
