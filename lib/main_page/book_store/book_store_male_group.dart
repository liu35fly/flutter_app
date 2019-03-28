import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:flutter_app/data/book_shelf_top_data.dart';
import 'package:flutter_app/main_page/book_store/comment_item_small_h.dart';
import 'package:flutter_app/main_page/book_store/comment_item_v.dart';
import 'package:flutter_app/utils/ase_utils.dart';
import 'package:flutter_app/data/base_list_data.dart';

class MaleGroup extends StatefulWidget {
  final String name;

  MaleGroup({Key key, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MaleGroupState();
  }
}

class MaleGroupState extends State<MaleGroup> {
  List<BookShelfTopData> list = [];

  @override
  void initState() {
    super.initState();
    _getDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: <Widget>[
            buildTopTip(),
            createListView(),
            createGrideView()
          ],
        ));
//    return createGrideView();
  }

  Widget buildTopTip() {
    return Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.name,
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    decoration: TextDecoration.none,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
            ),
            GestureDetector(
                onTap: () {
//                  getData();
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '换一换',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16.0,
                        decoration: TextDecoration.none,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal),
                  ),
                ))
          ],
        ));
  }

  Widget createListView() {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      childAspectRatio: 3 / 5,
      controller: ScrollController(keepScrollOffset: false),
//      padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
      mainAxisSpacing: 0.0,
      crossAxisSpacing: 0.0,
      scrollDirection: Axis.vertical,
      children: _createListItemV(),
    );
  }

  Widget createGrideView() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 2 / 1,
      controller: ScrollController(keepScrollOffset: false),
//      padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
      mainAxisSpacing: 0.0,
      crossAxisSpacing: 0.0,
      scrollDirection: Axis.vertical,
      children: _createListItemH(),
    );
  }

  List<Widget> _createListItemV() {
    var length = 0;
    List<Widget> listItem = [];
    if (list == null || list.isEmpty) {
      return listItem;
    }
    if (list.length <= 4) {
      length = list.length;
    } else {
      length = 4;
    }
    for (var i = 0; i < length; i++) {
      listItem.add(CommentItemV(context: context, data: list[i]));
    }
    return listItem;
  }

  List<Widget> _createListItemH() {
    var length = 0;
    List<Widget> listItem = [];
    if (list == null || list.isEmpty) {
      return listItem;
    }
//    if (list.length <= 4) {
//      return null;
//    }
//    for (var i = 4; i < list.length; i++) {
//      listItem.add(CommentItemH(context: context, data: list[i]));
//    }
    for (var i = 0; i < list.length; i++) {
      listItem.add(CommentItemH(context: context, data: list[i]));
    }
    return listItem;
  }

  void _getDatas() async {
    Response response;
    Dio dio = new Dio();
    response =
        await dio.get("http://cc.a0d11.com/index/book/hotRecommendBook?res=");
//    response = await dio.post("/test", data: {"id": 12, "name": "wendu"});
    print(response.data.toString());
// 请求参数也可以通过对象传递，上面的代码等同于：
//    response = await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
//    print(response.data.toString());

    AESUtils().decryptData(response.data.toString()).then((value) {
      Map<String, dynamic> map = json.decode(value);
      var baseData = new BaseListData.fromJson(map);
//      print(baseData.data);
//      Map<String, dynamic> maps = json.decode(baseData.data);
      list = getBookShelfTopDataList(baseData.data);
      setState(() {});
    });
  }
}
