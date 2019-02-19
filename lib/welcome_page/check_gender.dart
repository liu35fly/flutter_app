import 'package:flutter/material.dart';

import 'package:flutter_app/main_page/main_page.dart';
import 'package:flutter_app/route_config/application.dart';

class CheckGenderHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '性别选择',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CheckGenderPage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}

class CheckGenderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CheckGenderPageState();
  }
}

class _CheckGenderPageState extends State<CheckGenderPage> {
  var maleIsClik = true;
  var femaleIsClik = true;

  var submitColor = Colors.grey;
  var iconList = [
    'images/gender_bg/icon_male.webp',
    'images/gender_bg/icon_female.webp',
    'images/gender_bg/icon_selected.png'
  ];

  void _changeMale() {
    setState(() {
      maleIsClik = false;
      femaleIsClik = true;
      submitColor = Colors.green;
    });
  }

  void _changeFemale() {
    setState(() {
      submitColor = Colors.green;
      maleIsClik = true;
      femaleIsClik = false;
    });
  }

  void _submit() {
    setState(() {
      if (maleIsClik && femaleIsClik) {
        return;
      }
      Application.router.navigateTo(context, "/mainPage", clearStack: true);
    });
  }

/*创建页面主体*/
  Widget creatMainPage() {
    return new Column(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.only(top: 60.0, bottom: 30.0),
            child: new Column(
              children: <Widget>[
                new Text(
                  '请选择你的性别',
                  style: new TextStyle(fontSize: 24.0, color: Colors.black45),
                ),
                new Text(
                  '我们将为你推荐感兴趣的书',
                  style: new TextStyle(fontSize: 16.0, color: Colors.black45),
                )
              ],
            )),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 60.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[createIconWidget(1), createIconWidget(2)],
            )),
        Container(
            padding: const EdgeInsets.only(top: 80.0, left: 15.0, right: 15.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new RaisedButton(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      onPressed: _submit,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: new Text(
                            '开启CC阅读',
                          )),
                        ),
                      ),
                      textColor: Colors.white,
//                disabledTextColor: Colors.white,
//                disabledColor: Colors.green,
                      colorBrightness: Brightness.light,
                      splashColor: Colors.green,
                      color: submitColor,
                      shape: RoundedRectangleBorder(
//        side: new BorderSide(
//          color: Colors.red[300],
//          width: 0.0,
//        ),
                        borderRadius: new BorderRadius.circular(40.0),
                      ),
//                highlightElevation: 5.0,
                      // 高亮时的浮动距离（可以尝试将该值设置的比elevation小，看看体验）
//                disabledElevation: 50.0,
                    ),
                  ),
                ),
              ),
            )),
      ],
    );
  }

/*创建头像选择部分*/
  Widget createIconWidget(int type) {
    var name = '';
    var icon = '';
    var selected = false;

    switch (type) {
      case 1:
        name = '男生';
        icon = iconList[0];
        selected=maleIsClik;
        break;
      case 2:
        name = '女生';
        icon = iconList[1];
        selected=femaleIsClik;
    }
    return new Column(
      children: <Widget>[
        new Text(
          name,
          style: new TextStyle(fontSize: 16.0, color: Colors.black45),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 8.0, right: 00.0),
          child: new Stack(
            children: <Widget>[
              FlatButton(
                child: Image.asset(
                  icon,
                  width: 140.0,
                  height: 140.0,
                ),
                onPressed: () {
                  switch (type) {
                    case 1:
                      _changeMale();
                      break;
                    case 2:
                      _changeFemale();
                      break;
                    default:
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.only(left: 130.0),
                child: Offstage(
                  offstage: selected,
                  child: Image.asset(
                    iconList[2],
                    width: 16.0,
                    height: 16.0,
                    alignment: Alignment.topLeft,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: creatMainPage(),
      ),
    );
  }
}
