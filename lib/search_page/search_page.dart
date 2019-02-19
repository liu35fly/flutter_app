import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_app/detail_page/book_detail_page.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "搜索",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SearchPageState(),
    );
  }
}

class SearchPageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }
}

class SearchState extends State<SearchPageState> {
  final TextEditingController _controller = new TextEditingController();
  final FocusNode _fn = new FocusNode();

  var tips = [
    "总裁大叔别靠近",
    "胭脂铺",
    "青春",
    "夜香",
    "青春无期",
    "美女总裁背后的男人",
    "娇妻迷乱",
    "曾以为你是余生",
    "挽爱成殇"
  ];

  var colors = [
    Colors.green,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.blue,
    Colors.pink
  ];

  var showTips = false;

  var data = BookData(
      'http://bookapp.dtbooking.com//image/%E5%A5%B9%E6%AF%94%E7%83%9F%E8%8A%B1%E8%BF%98%E8%80%80%E7%9C%BC.jpg',
      '书库');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        createTitle(),
        Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            child: Offstage(
              offstage: showTips,
              child: createTips(),
            )),
        Expanded(
            child: Offstage(
          offstage: !showTips,
          child: createList(),
        ))
      ],
    );
  }

  Widget createTitle() {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                controller: _controller,
                cursorColor: Colors.grey,
                focusNode: _fn,
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: "特工皇妃",
                ),
                onSubmitted: (msg) {
                  _fn.unfocus();
                  print(msg);
                  showTips = true;
                },
              )),
              FlatButton(
                onPressed: () {
                  _controller.clear();
                },
                child: Text("取消"),
                color: Colors.grey[200],
                textColor: Colors.green,
              )
            ],
          ),
          Container(
            width: 360.0,
            height: 1.0,
            color: Colors.grey[200],
          ),
        ]));

//    EditableText(
//      controller: _controller,
//      cursorColor: Colors.grey,
//      textDirection: TextDirection.ltr,
//      focusNode: FocusNode(),
//      style: TextStyle(color: Colors.grey),
//      onSubmitted: (msg) {
//        print(msg);
//      },
//    ),
  }

  Widget createTips() {
    return Flow(
      delegate:
          TextFlowDelegate(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0)),
      children: <Widget>[
        Text(tips[0],
            style:
                TextStyle(color: colors[Random().nextInt(5)], fontSize: 13.0)),
        Text(tips[1],
            style:
                TextStyle(color: colors[Random().nextInt(5)], fontSize: 13.0)),
        Text(tips[2],
            style:
                TextStyle(color: colors[Random().nextInt(5)], fontSize: 13.0)),
        Text(tips[3],
            style:
                TextStyle(color: colors[Random().nextInt(5)], fontSize: 13.0)),
        Text(tips[4],
            style:
                TextStyle(color: colors[Random().nextInt(5)], fontSize: 13.0)),
        Text(tips[5],
            style:
                TextStyle(color: colors[Random().nextInt(5)], fontSize: 13.0)),
        Text(tips[6],
            style:
                TextStyle(color: colors[Random().nextInt(5)], fontSize: 13.0)),
        Text(tips[7],
            style:
                TextStyle(color: colors[Random().nextInt(5)], fontSize: 13.0)),
        Text(tips[8],
            style:
                TextStyle(color: colors[Random().nextInt(5)], fontSize: 13.0)),
      ],
    );
  }

  Widget createList() {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (context, i) {
          return getListItem(i);
        });
  }

  Widget getListItem(int i) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new BookDetailPage(bookId: "0",)),
          ).then((value) {});
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Image.network(
                'http://bookapp.dtbooking.com//image/%E5%A5%B9%E6%AF%94%E7%83%9F%E8%8A%B1%E8%BF%98%E8%80%80%E7%9C%BC.jpg',
                width: 89.0,
                height: 119.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '岁岁平安',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21.0,
                            fontStyle: FontStyle.normal,
                            decorationStyle: TextDecorationStyle.solid),
                      ),
                    ),
                    Container(
                      width: 220.0,
                      padding: const EdgeInsets.only(top: 29.0, bottom: 20.0),
                      child: Text(
                        '在这一步中，您将添加一个显示收藏夹内容的新页面（在Flutter中称为路由(route)）。您将学习如何在主路由和新路由之间导航（切换页面）。在Flutter中，导航器管理应用程序的路由栈。将路由推入（push）到导航器的栈中，将会显示更新为该路由页面。 从导航器的栈中弹出（pop）路由，将显示返回到前一个路由',
                        style: TextStyle(
                          fontSize: 11.0,
                          color: Colors.grey,
                        ),
                        maxLines: 3,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Material(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.green,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 1.0,
                                  bottom: 1.0,
                                  left: 10.0,
                                  right: 10.0),
                              child: Text(
                                '都市',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11.0),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 17.0),
                          child: Text(
                            '4897649879人已读',
                            style:
                                TextStyle(fontSize: 11.0, color: Colors.grey),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class TextFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  var heigth = double.maxFinite;

  TextFlowDelegate({this.margin});

  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;

    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
    heigth = y;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(360.0, 100.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
