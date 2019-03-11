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
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: const EdgeInsets.only(
            left: 27.0,
          ),
          child: Text(
            bookClassData.name,
            style: TextStyle(fontSize: 16.0, color: Colors.black54),
          )),
      Padding(
          padding: const EdgeInsets.only(top: 15.0, right: 27.0),
          child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                  height: 50.0,
                  width: 65.0,
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: <Widget>[
                              createIcon(bookClassData.icons[0], 32, 40),
                              createIcon(bookClassData.icons[1], 32, 40)
                            ],
                          )),
                      Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(left: 16.0),
                          child: createIcon(bookClassData.icons[2], 32, 46))
                    ],
                  ))))
    ]);
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
    response =
        await dio.get("http://cc.kexigia.com/index/book/hotRecommendBook?res=");
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
