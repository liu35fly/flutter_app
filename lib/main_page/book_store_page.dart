import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_app/main_page/banner_view.dart';
import 'package:flutter_app/detail_page/book_detail_page.dart';
import 'package:flutter_app/rank_page/rank_page.dart';
import 'package:flutter_app/search_page/search_page.dart';
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

class _BookStoreState extends State<BookStorePage>
    with TickerProviderStateMixin {
  List<String> list = [
    'images/icon_bg_start.png',
    'images/icon_bg_start.png',
    'images/icon_bg_start.png',
  ];

  AnimationController controllerOne;
  AnimationController controllerTwo;
  AnimationController controllerThree;
  CurvedAnimation curvedOne;
  CurvedAnimation curvedTwo;
  CurvedAnimation curvedThree;

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
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new RankPageHome(title: '书库')),
        ).then((value) {});
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

        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new RankPageHome(title: '排行')),
        ).then((value) {});
        break;
      case 2:
        Fluttertoast.showToast(
            msg: "男生",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            bgcolor: "#e74c3c",
            textcolor: '#ffffff');
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new RankPageHome(title: '男生')),
        ).then((value) {});
        break;
      case 3:
        Fluttertoast.showToast(
            msg: "女生",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            bgcolor: "#e74c3c",
            textcolor: '#ffffff');
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new RankPageHome(title: '女生')),
        ).then((value) {});
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
    controllerOne =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controllerTwo =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controllerThree =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    curvedOne =
        new CurvedAnimation(parent: controllerOne, curve: Curves.linear);
    curvedTwo =
        new CurvedAnimation(parent: controllerTwo, curve: Curves.linear);
    curvedThree = new CurvedAnimation(
        parent: controllerThree, curve: Curves.linear); //模仿小球自由落体运动轨迹
    data = BookData(
        'http://bookapp.dtbooking.com//image/%E5%A5%B9%E6%AF%94%E7%83%9F%E8%8A%B1%E8%BF%98%E8%80%80%E7%9C%BC.jpg',
        '书库');
    init();
  }

  void init() {
    row = Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new SearchPage()),
                ).then((value) {});
              },
              child: Image.asset(
                "images/main_icon/icon_search_and_txt.png",
                height: 44.0,
              ),
            )),
            Column(
              children: <Widget>[
                Image(
                  image: AssetImage('images/main_icon/icon_store.png'),
                  width: 33.0,
                  height: 33.0,
                ),
                Text('书架', style: new TextStyle(fontSize: 12.0))
              ],
            )
          ],
        ));

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text('换一换'),
                      onPressed: () {
                        controllerOne.repeat();
                      },
                      splashColor: Colors.white,
                      disabledColor: Colors.white,
                    ),
                    RotationTransition(
                      turns: curvedOne,
                      child: Image.asset(
                        'images/icon_refresh.png',
                        width: 12.0,
                        height: 12.0,
                      ),
                    ),
                  ],
                )
              ],
            )),
        Container(
            padding: const EdgeInsets.only(top: 20.0, bottom: 00.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new BookDetailPage(
                                data: data,
                              )),
                    ).then((value) {});
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
                  '男生精选',
                  style: new TextStyle(fontSize: 15.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text('换一换'),
                      onPressed: () {
                        controllerTwo.repeat();
                      },
                      splashColor: Colors.white,
                      disabledColor: Colors.white,
                    ),
                    RotationTransition(
                      turns: curvedTwo,
                      child: Image.asset(
                        'images/icon_refresh.png',
                        width: 12.0,
                        height: 12.0,
                      ),
                    ),
                  ],
                )
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
                  '女生精选',
                  style: new TextStyle(fontSize: 15.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text('换一换'),
                      onPressed: () {
                        controllerThree.repeat();
                      },
                      splashColor: Colors.white,
                      disabledColor: Colors.white,
                    ),
                    RotationTransition(
                      turns: curvedThree,
                      child: Image.asset(
                        'images/icon_refresh.png',
                        width: 12.0,
                        height: 12.0,
                      ),
                    ),
                  ],
                )
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
    return Column(children: <Widget>[
      row,
      Expanded(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new BannerWidget(list),
            titles,
            listOne,
            listMale,
            listFemale
          ],
        ),
      ))
    ]);
  }
}
