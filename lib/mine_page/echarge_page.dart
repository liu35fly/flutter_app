import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EchargePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '充值',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: EchargePageHome(),
    );
  }
}

class EchargePageHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _EchargePageState();
  }
}

class _EchargePageState extends State<EchargePageHome> {
  var price_0;

  var price_1;

  var price_2;

  var price_3;

  var price_4;

  var price_5;

  var selectAli;

  var selectWechat;

  var price = 0;
  var type = 0;

  Widget createEchargePrice(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Text('请选择充值金额',
              style: TextStyle(
                  color: Colors.black,
                  decorationStyle: TextDecorationStyle.double)),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        _onClikPrice(0);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    price_0 ? Colors.green : Colors.transparent,
                                width: 1.0),
                            borderRadius: BorderRadius.circular(5.0)),
//                    borderRadius: BorderRadius.circular(5.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '30元',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 15.0),
                            ),
                            Divider(
                              height: 1.0,
                              color: Colors.grey,
                            ),
                            Text(
                              '3000书币',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                            Text(
                              '赠送0',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 12.0),
                            )
                          ],
                        ),
                      )),
                  flex: 1,
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        _onClikPrice(1);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    price_1 ? Colors.green : Colors.transparent,
                                width: 1.0),
                            borderRadius: BorderRadius.circular(5.0)),
//                    borderRadius: BorderRadius.circular(5.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '50元',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 15.0),
                            ),
                            Divider(
                              height: 1.0,
                              color: Colors.grey,
                            ),
                            Text(
                              '(5000+2000)书币',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                            Text(
                              '首充赠送',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 12.0),
                            )
                          ],
                        ),
                      )),
                  flex: 1,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        _onClikPrice(2);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    price_2 ? Colors.green : Colors.transparent,
                                width: 1.0),
                            borderRadius: BorderRadius.circular(5.0)),
//                    borderRadius: BorderRadius.circular(5.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '100元',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 15.0),
                            ),
                            Divider(
                              height: 1.0,
                              color: Colors.grey,
                            ),
                            Text(
                              '(10000+3000)书币',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                            Text(
                              '多送30元',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 12.0),
                            )
                          ],
                        ),
                      )),
                  flex: 1,
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        _onClikPrice(3);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    price_3 ? Colors.green : Colors.transparent,
                                width: 1.0),
                            borderRadius: BorderRadius.circular(5.0)),
//                    borderRadius: BorderRadius.circular(5.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '200元',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 15.0),
                            ),
                            Divider(
                              height: 1.0,
                              color: Colors.grey,
                            ),
                            Text(
                              '(20000+6000)书币',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                            Text(
                              '多送60元',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 12.0),
                            )
                          ],
                        ),
                      )),
                  flex: 1,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        _onClikPrice(4);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    price_4 ? Colors.green : Colors.transparent,
                                width: 1.0),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '500元',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 15.0),
                            ),
                            Divider(
                              height: 1.0,
                              color: Colors.grey,
                            ),
                            Text(
                              '(50000+20000)书币',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                            Text(
                              '多送200元',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 12.0),
                            )
                          ],
                        ),
                      )),
                  flex: 1,
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        _onClikPrice(5);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    price_5 ? Colors.green : Colors.transparent,
                                width: 1.0),
                            borderRadius: BorderRadius.circular(5.0)),
//                    borderRadius: BorderRadius.circular(5.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '1000元',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 15.0),
                            ),
                            Divider(
                              height: 1.0,
                              color: Colors.grey,
                            ),
                            Text(
                              '(100000+5000)书币',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                            Text(
                              '多送500元',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 12.0),
                            )
                          ],
                        ),
                      )),
                  flex: 1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget createEchargeAli(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _onSelectType(0);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Image.asset(
                  'images/mine_icon/icon_alipay.png',
                  width: 18.0,
                  height: 18.0,
                )),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    '支付宝支付',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Offstage(
                    offstage: selectAli, //这里控制
                    child: Image.asset(
                      'images/mine_icon/icon_selected.png',
                      width: 15.0,
                      height: 15.0,
                    )))
          ],
        ));
  }

  Widget createEchargeWechat(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _onSelectType(1);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Image.asset(
                  'images/mine_icon/icon_wechat.png',
                  width: 18.0,
                  height: 18.0,
                )),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    '微信支付',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Offstage(
                    offstage: selectWechat, //这里控制
                    child: Image.asset(
                      'images/mine_icon/icon_selected.png',
                      width: 15.0,
                      height: 15.0,
                    )))
          ],
        ));
  }

  @override
  void initState() {
    super.initState();

    price_0 = true;
    price_1 = false;
    price_2 = false;
    price_3 = false;
    price_4 = false;
    price_5 = false;

    selectAli = false;
    selectWechat = true;
  }

  void _onClikPrice(int postion) {
    price = postion;
    switch (postion) {
      case 0:
        setState(() {
          price_0 = true;
          price_1 = false;
          price_2 = false;
          price_3 = false;
          price_4 = false;
          price_5 = false;
        });
        break;
      case 1:
        setState(() {
          price_0 = false;
          price_1 = true;
          price_2 = false;
          price_3 = false;
          price_4 = false;
          price_5 = false;
        });
        break;
      case 2:
        setState(() {
          price_0 = false;
          price_1 = false;
          price_2 = true;
          price_3 = false;
          price_4 = false;
          price_5 = false;
        });
        break;
      case 3:
        setState(() {
          price_0 = false;
          price_1 = false;
          price_2 = false;
          price_3 = true;
          price_4 = false;
          price_5 = false;
        });
        break;
      case 4:
        setState(() {
          price_0 = false;
          price_1 = false;
          price_2 = false;
          price_3 = false;
          price_4 = true;
          price_5 = false;
        });
        break;
      case 5:
        setState(() {
          price_0 = false;
          price_1 = false;
          price_2 = false;
          price_3 = false;
          price_4 = false;
          price_5 = true;
        });
        break;
    }
  }

  void _onSelectType(int position) {
    type = position;
    switch (position) {
      case 0:
        setState(() {
          selectAli = false;
          selectWechat = true;
        });
        break;
      case 1:
        setState(() {
          selectAli = true;
          selectWechat = false;
        });
        break;
    }
  }

  void _onSubmit() {
    var priceTotal = 0;
    var echargeType = "";
    switch (price) {
      case 0:
        priceTotal = 30;
        break;
      case 1:
        priceTotal = 50;
        break;
      case 2:
        priceTotal = 100;
        break;
      case 3:
        priceTotal = 200;
        break;
      case 4:
        priceTotal = 500;
        break;
      case 5:
        priceTotal = 1000;
        break;
    }

    switch (type) {
      case 0:
        echargeType = "支付宝";
        break;
      case 1:
        echargeType = "微信";
        break;
    }

    Fluttertoast.showToast(
        msg: "充值金额:$priceTotal\n充值方式:$echargeType",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        bgcolor: "#e74c3c",
        textcolor: '#ffffff');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0),
            child: RichText(
                text: TextSpan(
                    text: '当前余额：',
                    style: TextStyle(color: Colors.grey),
                    children: [
                  TextSpan(text: '0.00', style: TextStyle(color: Colors.green)),
                  TextSpan(text: '书币', style: TextStyle(color: Colors.grey))
                ]))),
        createEchargePrice(context),
        Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text('请选择支付方式：')),
        Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: createEchargeAli(context)),
        Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: createEchargeWechat(context)),
        Container(
            padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
            child: Material(
              borderRadius: BorderRadius.circular(40.0),
              child: new RaisedButton(
                padding: const EdgeInsets.only(
                    left: 110.0, right: 110.0, top: 15.0, bottom: 15.0),
                onPressed: _onSubmit,
                child: new Text(
                  '立即充值',
                ),
                textColor: Colors.white,
                disabledTextColor: Colors.white,
                disabledColor: Colors.green,
                colorBrightness: Brightness.dark,
                splashColor: Colors.green,
                color: Colors.green,
                highlightElevation: 5.0,
                // 高亮时的浮动距离（可以尝试将该值设置的比elevation小，看看体验）
                disabledElevation: 50.0,
              ),
            ))
      ],
    );
  }
}
