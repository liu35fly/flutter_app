import 'package:flutter/material.dart';

class RankPageHome extends StatelessWidget {
//  final String title;

//  RankPageHome({Key key, @required this.title}) : super(key: key);

  RankPageHome({int type = 0}) : this.type = type;

  final int type;

  String getTitle(int type) {
    switch (type) {
      case 0:
        return "书架";
      case 1:
        return "排行";
      case 2:
        return "男生";
      case 3:
        return "女生";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          getTitle(type),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: RankPage(),
    );
  }
}

class RankPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RankPageState();
  }
}

class RankPageState extends State<RankPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (context, i) {
          return getListItem(i);
        });
  }

  Widget getListItem(int i) {
    return Padding(
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
                              top: 1.0, bottom: 1.0, left: 10.0, right: 10.0),
                          child: Text(
                            '都市',
                            style:
                                TextStyle(color: Colors.white, fontSize: 11.0),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0),
                      child: Text(
                        '4897649879人已读',
                        style: TextStyle(fontSize: 11.0, color: Colors.grey),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
