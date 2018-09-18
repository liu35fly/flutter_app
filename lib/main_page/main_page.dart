import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/main_page/book_shelf_page.dart';
import 'package:flutter_app/main_page/book_store_page.dart';
import 'package:flutter_app/main_page/book_mine_page.dart';
import 'package:flutter_app/detail_page/book_detail_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
//  页面当前选中的tab的索引
   var _tabIndex=0;

//  页面body部分组件
  var _body;

  var tabImages;

  var appBarTitles = ['书架', '书库', '我的'];

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/main_icon/icon_book_shelf_selected_no.png'),
          getTabImage('images/main_icon/icon_book_shelf_selected.png')
        ],
        [
          getTabImage('images/main_icon/icon_book_store_selected_no.png'),
          getTabImage('images/main_icon/icon_book_store_selected.png')
        ],
        [
          getTabImage('images/main_icon/icon_mine_selected_no.png'),
          getTabImage('images/main_icon/icon_mine_selected.png')
        ]
      ];
    }
    _body = new IndexedStack(
      children: <Widget>[
        new BookShelfPage(),
        new BookStorePage(context),
        new BookMinePage()
      ],
      index: _tabIndex,
    );
  }

  // 传入图片路径，返回一个Image组件
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  List<BottomNavigationBarItem> getBottomNavItems() {
    List<BottomNavigationBarItem> list = new List();
    for (int i = 0; i < 3; i++) {
      list.add(new BottomNavigationBarItem(
          icon: getTabIcon(i), title: getTabTitle(i)));
    }
    return list;
  }

//  根据索引确定tab的状态
  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new TextStyle(color: Colors.green);
    }
    return new TextStyle(color: Colors.grey);
  }

//根据索引确定tabItem的icon状态
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

//根据索引返回页面顶部标题
  Text getTabTitle(int curIndex) {
    return new Text(
      appBarTitles[curIndex],
      style: getTabTextStyle(curIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
//    new CupertinoTabBar(
//      items: getBottomNavItems(),
//      currentIndex: _tabIndex,
//      onTap: (index) {
//        setState(() {
//          _tabIndex = index;
//        });
//      },
//    );
    initData();
    return new MaterialApp(
      theme: new ThemeData(primaryColor: const Color(0xFF63CA6C)),
      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text(
//            'main',
//            style: new TextStyle(color: Colors.white),
//          ),
//          iconTheme: new IconThemeData(color: Colors.white),
//        ),
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: getBottomNavItems(),
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
      ),
//      routes: <String, WidgetBuilder>{
//        '/warehouse': (BuildContext context) => new BookDetailPage()
//      },
    );
  }
}
