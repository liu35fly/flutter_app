import 'package:flutter/material.dart';
import 'package:flutter_app/main_page/banner_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/detail_page/book_detail_page.dart';
import 'package:flutter_app/rank_page/rank_page.dart';
import 'dart:async';

//class BookStorePage extends StatelessWidget {
//  final parentContext;
//
//  BookStorePage(this.parentContext);
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//        home: BookStorePageHome(parentContext),);
////        routes: <String, WidgetBuilder>{
////
////        });
//  }
//}

class BookStorePage extends StatefulWidget {
  final parentContext;

  BookStorePage(this.parentContext);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BookStoreState();
  }
}

class _BookStoreState extends State<BookStorePage> {
  List<String> list = [
    'images/icon_bg_start.png',
    'images/icon_bg_start.png',
    'images/icon_bg_start.png',
  ];

  ///排行的点击事件 0书库 1排行 2男生 3 女生
  void _clikRank(int type) {
    switch (type) {
      case 0:
        Fluttertoast.showToast(
            msg: "书库",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            bgcolor: "#e74c3c",
            textcolor: '#ffffff');
//        data=BookData('http://bookapp.dtbooking.com//image/%E5%A5%B9%E6%AF%94%E7%83%9F%E8%8A%B1%E8%BF%98%E8%80%80%E7%9C%BC.jpg', '书库');
        Navigator
            .push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new RankPageHome(title: '书库')),
            )
            .then((value) {});
//        Navigator.of(context).pushNamed('/warehouse');

        break;
      case 1:
        Fluttertoast.showToast(
            msg: "排行",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            bgcolor: "#e74c3c",
            textcolor: '#ffffff');

        Navigator
            .push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new RankPageHome(title: '排行')),
            )
            .then((value) {});
        break;
      case 2:
        Fluttertoast.showToast(
            msg: "男生",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            bgcolor: "#e74c3c",
            textcolor: '#ffffff');
        Navigator
            .push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new RankPageHome(title: '男生')),
            )
            .then((value) {});
        break;
      case 3:
        Fluttertoast.showToast(
            msg: "女生",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            bgcolor: "#e74c3c",
            textcolor: '#ffffff');
        Navigator
            .push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new RankPageHome(title: '女生')),
            )
            .then((value) {});
        break;
      default:
    }
  }

  var row;

  var titles;

  var listOne;

  var listMale;
  var listFemale;

  var data;

  @override
  void initState() {
    super.initState();
    data = BookData(
        'http://bookapp.dtbooking.com//image/%E5%A5%B9%E6%AF%94%E7%83%9F%E8%8A%B1%E8%BF%98%E8%80%80%E7%9C%BC.jpg',
        '书库');
    init();
  }

  void init() {
    row = Row(
      children: <Widget>[
        Expanded(child: new TextField()),
        Column(
          children: <Widget>[
            Image(
              image: AssetImage('images/main_icon/icon_store.png'),
              width: 33.0,
              height: 33.0,
            ),
            Text('书架', style: new TextStyle(fontSize: 15.0))
          ],
        )
      ],
    );

    titles = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            onPressed: () {
              _clikRank(0);
            },
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('images/main_icon/icon_warehouse.png'),
                  width: 33.0,
                  height: 33.0,
                ),
                Text('书库', style: new TextStyle(color: Colors.black))
              ],
            )),
        FlatButton(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            onPressed: () {
              _clikRank(1);
            },
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('images/main_icon/icon_rank.png'),
                  height: 33.0,
                  width: 33.0,
                ),
                Text('排行', style: new TextStyle(color: Colors.black))
              ],
            )),
        FlatButton(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            onPressed: () {
              _clikRank(2);
            },
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('images/main_icon/icon_male_small.png'),
                  height: 33.0,
                  width: 33.0,
                ),
                Text('男生', style: new TextStyle(color: Colors.black))
              ],
            )),
        FlatButton(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            onPressed: () {
              _clikRank(3);
            },
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('images/main_icon/icon_female_small.png'),
                  width: 33.0,
                  height: 33.0,
                ),
                Text(
                  '女生',
                  style: new TextStyle(color: Colors.black),
                )
              ],
            ))
      ],
    );

    listOne = Column(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.only(
                top: 00.0, bottom: 00.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '每周精选',
                  style: new TextStyle(fontSize: 15.0),
                ),
                RaisedButton(
                  child: Text('换一换'),
                  onPressed: null,
                  disabledColor: Colors.white,
                ),
              ],
            )),
        Container(
            padding: const EdgeInsets.only(top: 20.0, bottom: 00.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator
                        .push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new BookDetailPage(
                                    data: data,
                                  )),
                        )
                        .then((value) {});
                  },
                  child: Image(
                    image: AssetImage('images/main_icon/icon_demo.jpg'),
                    width: 101.0,
                    height: 134.0,
                  ),
                ),
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
              ],
            )),
        Container(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
              ],
            ))
      ],
    );

    listMale = Column(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 00.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '每周精选',
                  style: new TextStyle(fontSize: 15.0),
                ),
                RaisedButton(
                  child: Text('换一换'),
                  onPressed: null,
                  disabledColor: Colors.white,
                ),
              ],
            )),
        Container(
            padding: const EdgeInsets.only(top: 20.0, bottom: 00.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
              ],
            )),
        Container(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
              ],
            ))
      ],
    );

    listFemale = Column(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 00.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '每周精选',
                  style: new TextStyle(fontSize: 15.0),
                ),
                RaisedButton(
                  child: Text('换一换'),
                  onPressed: null,
                  disabledColor: Colors.white,
                ),
              ],
            )),
        Container(
            padding: const EdgeInsets.only(top: 20.0, bottom: 00.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
              ],
            )),
        Container(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
                Image(
                  image: AssetImage('images/main_icon/icon_demo.jpg'),
                  width: 101.0,
                  height: 134.0,
                ),
              ],
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          row,
          new BannerWidget(list),
          titles,
          listOne,
          listMale,
          listFemale
        ],
      ),
    );
  }
}
