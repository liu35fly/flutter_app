import 'package:flutter/material.dart';
import 'package:flutter_app/main_page/main_page.dart';

class CheckGenderHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '主页',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CheckGenderPage(),
        routes: <String, WidgetBuilder>{
          '/main': (BuildContext context) => new MainPage()
        });
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
      Navigator.of(context).pushReplacementNamed('/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    var clumn = new Column(
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
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Text(
                      '男生',
                      style:
                          new TextStyle(fontSize: 16.0, color: Colors.black45),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(top: 8.0, right: 00.0),
                      child: new Stack(
                        children: <Widget>[
                          FlatButton(
                            child: Image.asset(
                              'images/gender_bg/icon_male.webp',
                              width: 140.0,
                              height: 140.0,
                            ),
                            onPressed: _changeMale,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 130.0),
                            child: Offstage(
                              offstage: maleIsClik,
                              child: Image.asset(
                                'images/gender_bg/icon_selected.png',
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
                ),
                new Column(
                  children: <Widget>[
                    new Text(
                      '女生',
                      style:
                          new TextStyle(fontSize: 16.0, color: Colors.black45),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(top: 8.0, left: 00.0),
                      child: new Stack(
                        children: <Widget>[
                          FlatButton(
                              child: Image.asset(
                                'images/gender_bg/icon_female.webp',
                                width: 140.0,
                                height: 140.0,
                              ),
                              onPressed: _changeFemale),
                          Container(
                              padding: const EdgeInsets.only(left: 130.0),
                              child: Offstage(
                                offstage: femaleIsClik,
                                child: Image.asset(
                                  'images/gender_bg/icon_selected.png',
                                  width: 16.0,
                                  height: 16.0,
                                  alignment: Alignment.topRight,
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                )
              ],
            )),
        Container(
            padding: const EdgeInsets.only(top: 80.0,left: 15.0,right: 15.0),
            child: new RaisedButton(
              padding: const EdgeInsets.only(
                   top: 10.0, bottom: 10.0),
              onPressed: _submit,
              child: Center(
                  child: new Text(
                '开启CC阅读',
              )),
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
            )),
      ],
    );

    return Scaffold(
      body: Center(
        child: clumn,
      ),
    );
  }
}
