import 'dart:async';

import 'package:fluro/fluro.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'check_gender.dart';
import 'package:flutter_app/route_config/application.dart';
import 'package:flutter_app/route_config/routes.dart';

class SplashPage extends StatelessWidget {

  SplashPage(){
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '首页',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashHomePage(
          title: '首页',
        ),
      onGenerateRoute: Application.router.generator,
        );
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
  _SplashHomePageState() {
  }

  startTime() async {
    //设置启动图生效时间
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Application.router.navigateTo(context,"/check",clearStack: true);
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
