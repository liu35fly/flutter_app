import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
//import 'package:encrypt/encrypt.dart' as encrypt;

import 'package:flutter_app/data/book_shelf_top_data.dart';
import 'package:flutter_app/data/base_list_data.dart';
import 'package:flutter_app/utils/ase_utils.dart';
import 'package:flutter_app/route_config/application.dart';

class BookShelfTopGroup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TopGroupState();
  }
}

class _TopGroupState extends State<BookShelfTopGroup> {
  List<BookShelfTopData> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return buildTop();
  }

//  Future<String> _decrypt(String content) async {
//    final key = encrypt.Key.fromUtf8('dgitlhoyt345jgi9');
//    final iv = encrypt.IV(Uint8List.fromList(utf8.encode('12gf-tgKhi-turfA')));
//
//    final encrypter =
//    encrypt.Encrypter(encrypt.AES(key, iv, mode: encrypt.AESMode.cbc));
//
////    final encrypted = encrypter.encrypt(plainText);
////    final decrypted = encrypter.decrypt(encrypted);
//    String decrypted = encrypter.decrypt64(content);
//    return decrypted;
////    print(decrypted);
////    return decrypted; // Lorem ipsum dolor sit amet, consectetur adipiscing elit
////    print(encrypted
////        .base64); // R4PxiU3h8YoIRqVowBXm36ZcCeNeZ4s1OvVBTfFlZRdmohQqOpPQqD1YecJeZMAop/hZ4OxqgC1WtwvX/hP9mw==
//  }
//
//  void _encrypt(String content) async {
//    final key = encrypt.Key.fromUtf8('dgitlhoyt345jgi9');
//    final iv = encrypt.IV(Uint8List.fromList(utf8.encode('12gf-tgKhi-turfA')));
//
//    final encrypter =
//    encrypt.Encrypter(encrypt.AES(key, iv, mode: encrypt.AESMode.cbc));
//
//    final encrypted = encrypter.encrypt(content);
////    final decrypted = encrypter.decrypt(encrypted);
////    final decrypted = encrypter.decrypt64(
////        "QFDsI+edreVi8TdMjUy09OWHQiVNxxa4Lx/Lax1mrakQ+cTOKtElE48H/i4F1OfFPWqsUVinNKDSS+lnAGg/t9VRJUiprP148rxtkA3KXsk=");
//
////    print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
//    print(encrypted
//        .base64); // R4PxiU3h8YoIRqVowBXm36ZcCeNeZ4s1OvVBTfFlZRdmohQqOpPQqD1YecJeZMAop/hZ4OxqgC1WtwvX/hP9mw==
//  }

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

    AESUtils().decryptData(response.data.toString()).then((value) {
      Map<String, dynamic> map = json.decode(value);
      var baseData = new BaseListData.fromJson(map);
//      print(baseData.data);
//      Map<String, dynamic> maps = json.decode(baseData.data);
      list = getBookShelfTopDataList(baseData.data);
      setState(() {});
    });
  }

  Widget buildTop() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: <Widget>[buildTopTip(), buildTopGroup()],
        ));
  }

  Widget buildTopTip() {
    return Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text('热门推荐'),
            ),
            GestureDetector(
                onTap: () {
                  _getData();
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('换一换'),
                ))
          ],
        ));
  }

  Widget buildTopGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buildTopItem(list),
    );
  }

  List<Widget> buildTopItem(List<BookShelfTopData> list) {
    List<Widget> listWidget = [];
    if (list.length == 0) {
      return listWidget;
    }
    for (var data in list) {
      listWidget.add(buildTopChildren(data));
    }

    return listWidget;
  }

  Widget buildTopChildren(BookShelfTopData data) {
    return Container(
        width: 54.0,
        child: GestureDetector(
          onTap: () {
            _onClik(data.bookId);
          },
          child: Column(
            children: <Widget>[
              Image.network(
                data.bookIconUrl,
                width: 54.0,
                height: 72.0,
              ),
              Text(data.bookName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Color(0xff333333),
                  ))
            ],
          ),
        ));
  }

  void _onClik(int bookId) {
    Application.router
        .navigateTo(context, "/detailPage?message=$bookId", clearStack: false);
  }
}
