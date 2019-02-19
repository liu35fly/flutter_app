import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_app/data/user.dart';
import 'package:flutter_app/file_utils/file_manager.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "登录",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Center(child: Text("注册")))
        ],
      ),
      body: LoginHome(),
    );
  }
}

class LoginHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginHome> with TickerProviderStateMixin {
  final TextEditingController _controllerPhone = new TextEditingController();
  final TextEditingController _controller = new TextEditingController();
  final FocusNode _fnPhone = new FocusNode();
  final FocusNode _fn = new FocusNode();

  var tip = "获取验证码";

  AnimationController controller;
  Animation<int> tween;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60000));

    controller.value = 0.0;
    tween = IntTween(begin: 60, end: 0).animate(controller)
      ..addListener(() {
        setState(() {
          tip = tween.value.toString() + "s";
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print("completed");
          controller.reset();
          setState(() {
            tip = "获取验证码";
            print(tip);
          });
        } else if (status == AnimationStatus.dismissed) {
//          controller.forward();
          print("dismissed");
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        createTitle(),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: createEdit(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
          child: createSubmit(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 80.0),
          child: createOtherTitle(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
          child: createOther(),
        )
      ],
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget createTitle() {
    return SizedBox(
      child: Center(
          child: Image.asset(
        "images/logo_320.png",
        width: 100.0,
        height: 100.0,
      )),
      width: 360.0,
      height: 200.0,
    );
  }

  Widget createEdit() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("+86"),
            Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  width: 1.0,
                  height: 15.0,
                  color: Colors.grey,
                )),
            Expanded(
                child: TextField(
              controller: _controllerPhone,
              focusNode: _fnPhone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "输入手机号",
                border: InputBorder.none,
              ),
            ))
          ],
        ),
        Container(
          width: 360.0,
          height: 1.0,
          color: Colors.grey[200],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: TextField(
              controller: _controller,
              focusNode: _fn,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "输入验证码",
                border: InputBorder.none,
              ),
            )),
            OutlineButton(
              onPressed: _clikVerification,
              borderSide: BorderSide(color: Colors.green, width: 1.0),
              child: Text(
                tip,
                style: TextStyle(color: Colors.green),
              ),
            )
          ],
        ),
        Container(
          width: 360.0,
          height: 1.0,
          color: Colors.grey[200],
        )
      ],
    );
  }

  Widget createSubmit() {
    return RaisedButton(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      onPressed: _clikSubmit,
      color: Colors.green,
      shape: RoundedRectangleBorder(
//        side: new BorderSide(
//          color: Colors.red[300],
//          width: 0.0,
//        ),
        borderRadius: new BorderRadius.circular(20.0),
      ),
      child: Center(
          child: new Text(
        "登录",
        style: new TextStyle(color: Colors.white),
      )),
    );
  }

  Widget createOtherTitle() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
          width: 100.0,
          height: 1.0,
          color: Colors.grey,
        )),
        Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text("第三方登录")),
        Expanded(
            child: Container(
          width: 100.0,
          height: 1.0,
          color: Colors.grey,
        ))
      ],
    );
  }

  Widget createOther() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Center(
          child: Image.asset("images/login_icon/icon_qq_round.png",
              width: 60.0, height: 60.0),
        )),
        Expanded(
            child: Center(
          child: Image.asset("images/login_icon/icon_wechat_round.png",
              width: 60.0, height: 60.0),
        )),
        Expanded(
            child: Center(
          child: Image.asset("images/login_icon/icon_weibo_round.png",
              width: 60.0, height: 60.0),
        ))
      ],
    );
  }

  void _clikVerification() {
    controller.forward();
//    print(FileManager.readCounter().toString());
    FileManager.readCounter().then((value) {
      print(value);
    });
  }

  void _clikSubmit() {
    setState(() {
      if (_controllerPhone.text.length == 0) {
        Fluttertoast.showToast(
            msg: "请输入电话号码",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Color(0xe74c3c),
            textColor: Color(0xffffff));
        return;
      }
      if (_controllerPhone.text.length != 11) {
        Fluttertoast.showToast(
            msg: "手机号码格式错误",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Color(0xe74c3c),
            textColor: Color(0xffffff));
        return;
      }

      if (_controller.text.length == 0) {
        Fluttertoast.showToast(
            msg: "请输入验证码",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Color(0xe74c3c),
            textColor: Color(0xffffff));
        return;
      }

      Fluttertoast.showToast(
          msg: "您输入的电话是：${_controllerPhone.text}\n 验证码是：${_controller.text}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Color(0xe74c3c),
          textColor: Color(0xffffff));
      User user = User(0, "name_0", _controllerPhone.text, _controller.text);
      String json = jsonEncode(user);
      FileManager.incremenCounter(json).then((value) {
        Navigator.pop(context);
      });
    });
  }
}
