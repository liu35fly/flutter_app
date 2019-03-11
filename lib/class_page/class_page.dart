import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_app/data/base_list_data.dart';
import 'package:flutter_app/data/book_class/book_class_data.dart';

class BookClassPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BookClassState();
  }
}

class BookClassState extends State<BookClassPage> {
  List<BookClassData> list = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '分类',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.green),
        ),
        body: GridView.count(
          crossAxisCount: 2,
//      shrinkWrap: true,
          childAspectRatio: 2 / 1,
//      padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
//      scrollDirection: Axis.vertical,
          children: listGroup(),
        ));
  }

  List<Widget> listGroup() {
    List<Widget> listCache = [];
    for (BookClassData data in list) {
//      if (data == null) {
//        return [];
//      }
      listCache.add(createItem(data));
    }
    return listCache;
  }

  Widget createItem(BookClassData bookClassData) {
    return SizedBox(
        height: 70.0,
        width: 180.0,
        child: Card(child: createIcons(bookClassData)));
  }

  Widget createIcons(BookClassData bookClassData) {
    return Padding(
        padding: const EdgeInsets.only(top: 15.0, right: 15.0, left: 15.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: SizedBox(
                  width: 65.0,
                  child: Text(
                    bookClassData.name,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(fontSize: 16.0, color: Colors.black54),
                  ))),
          Align(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                  height: 50.0,
                  width: 65.0,
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: createIconImages(bookClassData),
                  )))
        ]));
  }

  List<Widget> createIconImages(BookClassData bookClassData) {
    List<Widget> list = [];
    switch (bookClassData.iconList.length) {
      case 0:
        break;
      case 1:
        Widget content = Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 16.0),
            child: createIcon(bookClassData.iconList[0], 32, 46));
        list.add(content);
        break;
      case 2:
        Widget content = Container(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: <Widget>[
                createIcon(bookClassData.iconList[0], 32, 40),
                createIcon(bookClassData.iconList[1], 32, 40)
              ],
            ));
        list.add(content);
        break;
      case 3:
        Widget content1 = Container(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: <Widget>[
                createIcon(bookClassData.iconList[0], 32, 40),
                createIcon(bookClassData.iconList[1], 32, 40)
              ],
            ));
        Widget content2 = Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 16.0),
            child: createIcon(bookClassData.iconList[2], 32, 46));
        list.add(content1);
        list.add(content2);
        break;
    }
    return list;
  }

  Widget createIcon(String iconUrl, double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: new Border.all(width: 0.5, color: Colors.grey),
//        color: Colors.grey,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
        image: DecorationImage(image: NetworkImage(iconUrl), fit: BoxFit.cover),
      ),
    );
  }

  void _getData() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get("http://172.29.222.1:8082/login/findAll");
//    response = await dio.post("/test", data: {"id": 12, "name": "wendu"});
    print(response.data.toString());
// 请求参数也可以通过对象传递，上面的代码等同于：
//    response = await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
//    print(response.data.toString());

    Map<String, dynamic> map = json.decode(response.data.toString());
    var baseData = new BaseListData.fromJson(map);
//      print(baseData.data);
//      Map<String, dynamic> maps = json.decode(baseData.data);
    list = getBookClassDataList(baseData.data);
    setState(() {});
  }
}
