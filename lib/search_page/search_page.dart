import 'package:flutter/material.dart';
import 'dart:math';

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
        createList()
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
                      showTips=true;
                    },
                  )),
              FlatButton(
                onPressed: null,
                child: Text("取消"),
                color: Colors.green,
                textColor: Colors.green,
              )
            ],
          ),
          Container(
            width: double.maxFinite,
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
    return ListView(
      shrinkWrap: true,
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
}

class TextFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  var heigth = double.maxFinite;

  TextFlowDelegate({this.margin});

  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;

    for (int i = 0; i < context.childCount; i++) {
      var w = context
          .getChildSize(i)
          .width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context
            .getChildSize(i)
            .height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context
            .getChildSize(i)
            .width + margin.left + margin.right;
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
