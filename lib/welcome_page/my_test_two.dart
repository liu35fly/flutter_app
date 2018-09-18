import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'check_gender.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'demo首页',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashHomePage(
          title: '叠层布局',
        ),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new CheckGenderHome()
        });
  }
}

class SplashHomePage extends StatefulWidget {
  SplashHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return new _SplashHomePageState();
  }
}

class _SplashHomePageState extends State<SplashHomePage> {
  startTime() async {
    //设置启动图生效时间
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      alignment: const Alignment(0.6, 0.6),
      children: <Widget>[
        Image.asset('images/icon_bg_start.png'
//          child: new Image.asset('images/icon_bg_start.png'),
//          backgroundImage: AssetImage('images/icon_bg_start.png'),
//          radius: 100.0,
            ),

        Container(
          padding: const EdgeInsets.only(bottom: 56.0),
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'images/icon_logo.png',
            width: 64.0,
            height: 64.0,
            alignment: Alignment.bottomCenter,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 30.0),
          alignment: Alignment.bottomCenter,
          child: new Text(
            'CC阅读',
            style: new TextStyle(
                fontSize: 18.0,
                color: Colors.black45,
                fontStyle: FontStyle.italic),
          ),
        ),
//        Container(
////          decoration: BoxDecoration(
////          ),
//          child: new Image.asset('images/icon_logo.png'),
//        )
      ],
    );

    return Scaffold(
      body: Center(
        child: stack,
      ),
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        leading: new IconButton(
//            icon: new Icon(Icons.menu), tooltip: '菜单', onPressed: null),
//        title: new Text('测试二title'),
//        actions: <Widget>[
//          new IconButton(
//              icon: new Icon(Icons.search), tooltip: '搜索', onPressed: null)
//        ],
//      ),
      body: Center(
        child: new Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                new Image.asset('images/icon_logo.png'),
              ],
            ),
          ),
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('images/icon_bg_start.png')),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        tooltip: 'add',
        child: new Icon(Icons.add),
      ),
    );
  }
}
