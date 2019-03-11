import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:flutter_app/data/book_shelf_top_data.dart';
import 'package:flutter_app/utils/ase_utils.dart';
import 'package:flutter_app/data/base_list_data.dart';
import 'package:flutter_app/data/book_shelf_top_data.dart';
import 'package:flutter_app/main_page/book_store/comment_item_v.dart';
import 'package:flutter_app/utils/share_preferences_manager.dart';
import 'package:flutter_app/utils/commen_tip.dart';
import 'package:flutter_app/route_config/application.dart';

class WeekGroup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WeekGroupState();
  }
}

class WeekGroupState extends State<WeekGroup> {
  List<BookShelfTopData> list = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: <Widget>[buildTopTip(), createGrideView()],
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
                '本周精选',
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
                  getData();
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

  Widget createGrideView() {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      childAspectRatio: 3 / 5,
//      padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
      mainAxisSpacing: 0.0,
      crossAxisSpacing: 0.0,
      scrollDirection: Axis.vertical,
      children: _createListItem(),
    );
  }

  List<Widget> _createListItem() {
    List<Widget> listItem = [];
    if (list == null || list.isEmpty) {
      return listItem;
    }
    for (BookShelfTopData i in list) {
      listItem.add(CommentItemV(context: context, data: i));
    }
    return listItem;
  }

  Widget _createCommentItemV(BookShelfTopData data) {
    return GestureDetector(
        onTap: () {
          print(data.bookName);
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              data.bookIconUrl,
              width: 74.0,
              height: 96.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                data.bookName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13.0, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                data.bookAuthor,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10.0, color: Colors.black26),
              ),
            )
          ],
        ));
  }

  Future<int> _checkGender() async {
    var prefs = await SharePrefercencesManager.instance.getSharePre();
    return prefs.getInt(CommenTip.shareSelectedGender);
  }

  void getData() {
    _checkGender().then((value) {
      _getDatas();
//      _getData(_createSendData(value));
    });
  }

  String _createSendData(int sex) {
    var cache = new Map<dynamic, dynamic>();
    var cs = new Map<String, int>();
    cache['id'] = 0;
    switch (sex) {
      case 2:
        cs['type_one'] = 1;
        cs['type_two'] = 1;
        break;
      default:
        cs['type_one'] = 0;
        cs['type_two'] = 0;
    }
    cache['channel'] = 'cc110';
    cache['type'] = 5;
    cache['likes'] = jsonEncode(cs);

    return json.encode(cache);
  }

  void _getData(String data) async {
    Response response;
    Dio dio = new Dio();

//    AESUtils().encryptData(data).then((value) {
//      dio
//          .post("http://cc.kexigia.com/index/home/change", data: value)
//          .then((complete) {
//        AESUtils().decryptData(complete.data.toString()).then((data) {
//          Map<String, dynamic> map = json.decode(data);
//          var baseData = new BaseListData.fromJson(map);
//        });
//      });
//    });

    var cache = await AESUtils().encryptData(data);
    response =
        await dio.post("http://cc.kexigia.com/index/home/change", data: cache);
    var s = await AESUtils().decryptData(response.data.toString());
    Map<String, dynamic> map = await json.decode(s);
    var baseData = new BaseListData.fromJson(map);
    list = getBookShelfTopDataList(baseData.data);
    setState(() {});
//     AESUtils().encryptData(data).then((value) {
//      dio.post("http://cc.kexigia.com/index/home/change", data: value);
//    }).then((value) {
//      Response response = value;
//      AESUtils().decryptData(response.data.toString());
//    }).then((value) {
//      Map<String, dynamic> map = json.decode(data);
//      var baseData = new BaseListData.fromJson(map);
//    });

//    response = await dio.post("http://cc.kexigia.com/index/home/index",data:value );
//    response = await dio.post("/test", data: {"id": 12, "name": "wendu"});
//    print(response.data.toString());
// 请求参数也可以通过对象传递，上面的代码等同于：
//    response = await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
//    print(response.data.toString());

//    AESUtils().decryptData(response.data.toString()).then((value) {
//      Map<String, dynamic> map = json.decode(value);
//      var baseData = new BaseListData.fromJson(map);
//      print(baseData.data);
//      Map<String, dynamic> maps = json.decode(baseData.data);
//      list = getBookShelfTopDataList(baseData.data);
//    setState(() {});
//    });
  }

  void _getDatas() async {
    Response response;
    Dio dio = new Dio();
    response =
        await dio.get("http://cc.kexigia.com/index/book/hotRecommendBook?res=");
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
