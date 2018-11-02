import 'package:flutter/material.dart';

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

class _LoginPageState extends State<LoginHome> {
  final TextEditingController _controllerPhone = new TextEditingController();
  final TextEditingController _controller = new TextEditingController();
  final FocusNode _fnPhone = new FocusNode();
  final FocusNode _fn = new FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        createTitle(),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: createEdit(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
          child: createSubmit(),
        )
      ],
    );
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
              onPressed: () {},
              borderSide: BorderSide(color: Colors.green, width: 1.0),
              child: Text(
                "获取验证码",
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
      onPressed: () {},
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

}
