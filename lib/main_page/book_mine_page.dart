import 'package:flutter/material.dart';
import 'package:flutter_app/mine_page/echarge_page.dart';
import 'package:flutter_app/login_page/LoginPage.dart';

class BookMinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('我的'),
          centerTitle: true,
        ),
        body: MinePage());
  }
}

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Container(
              height: 200.0,
              color: Colors.blue,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new LoginPage()),
                  ).then((value) {});
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: icon,
                    ),
                    name
                  ],
                ))
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: titles,
        ),
//        itemsPackage
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    'images/mine_icon/icon_wallet.png',
                    width: 16.0,
                    height: 18.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text('钱包'),
                  )
                ],
              ),
              Container(
                  width: 61.0,
                  height: 24.0,
                  child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      child: new RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new EchargePage()),
                          ).then((value) {});
                        },
                        child: new Text(
                          '充值',
                          style: new TextStyle(fontSize: 12.0),
                        ),
                        textColor: Colors.white,
                        disabledTextColor: Colors.white,
                        disabledColor: Colors.green,
                        colorBrightness: Brightness.dark,
                        color: Colors.green,
                        splashColor: Colors.green,
                      )))
            ],
          ),
        ),
        itemsRead,
        itemsEcharge,
        itemsConsumtion,
        itemsPhone,
        itemsServer
      ],
    ));
  }

  var icon = new CircleAvatar(
    backgroundImage: AssetImage('images/logo_320.png'),
    radius: 30.0,
  );

  var name = new Text('刘亦菲');

  var titles = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Column(
        children: <Widget>[
          Text(
            '0',
            style: new TextStyle(color: Colors.red, fontSize: 18.0),
          ),
          Text(
            '账户余额',
            style: new TextStyle(color: Colors.grey, fontSize: 12.0),
          )
        ],
      ),
      Container(
        width: 1.0,
        height: 36.0,
        color: Colors.grey,
      ),
      Column(
        children: <Widget>[
          Text(
            '0',
            style: new TextStyle(color: Colors.red, fontSize: 18.0),
          ),
          Text(
            '我的评论',
            style: new TextStyle(color: Colors.grey, fontSize: 12.0),
          )
        ],
      ),
      Container(
        width: 1.0,
        height: 36.0,
        color: Colors.grey,
      ),
      Column(
        children: <Widget>[
          Text(
            '0',
            style: new TextStyle(color: Colors.red, fontSize: 18.0),
          ),
          Text(
            '我的消息',
            style: new TextStyle(color: Colors.grey, fontSize: 12.0),
          )
        ],
      )
    ],
  );

//  var itemsPackage = Padding(
//    padding: const EdgeInsets.all(10.0),
//    child: Row(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      children: <Widget>[
//        Row(
//          children: <Widget>[
//            Image.asset(
//              'images/mine_icon/icon_wallet.png',
//              width: 16.0,
//              height: 18.0,
//            ),
//            Padding(
//              padding: const EdgeInsets.only(left: 5.0),
//              child: Text('钱包'),
//            )
//          ],
//        ),
//        Container(
//            width: 61.0,
//            height: 24.0,
//            child: Material(
//                borderRadius: BorderRadius.circular(20.0),
//                child: new RaisedButton(
//                  onPressed: (){
//                    Navigator
//                        .push(
//                      context,
//                      new MaterialPageRoute(
//                          builder: (context) => new EchargePage()),
//                    )
//                        .then((value) {});
//                  },
//                  child: new Text(
//                    '充值',
//                    style: new TextStyle(fontSize: 12.0),
//                  ),
//                  textColor: Colors.white,
//                  disabledTextColor: Colors.white,
//                  disabledColor: Colors.green,
//                  colorBrightness: Brightness.dark,
//                  splashColor: Colors.green,
//                )))
//      ],
//    ),
//  );

  var itemsRead = GestureDetector(
      onTap: () {
        print('最近阅读');
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'images/mine_icon/icon_clock.png',
                  width: 16.0,
                  height: 18.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text('最近阅读'),
                )
              ],
            ),
            Image.asset(
              'images/icon_right.png',
              width: 10.0,
              height: 30.0,
            )
          ],
        ),
      ));

  var itemsEcharge = GestureDetector(
      onTap: () {
        print('充值记录');
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'images/mine_icon/icon_echarge.png',
                  width: 16.0,
                  height: 18.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text('充值记录'),
                )
              ],
            ),
            Image.asset(
              'images/icon_right.png',
              width: 10.0,
              height: 30.0,
            )
          ],
        ),
      ));

  var itemsConsumtion = GestureDetector(
      onTap: () {
        print('消费记录');
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'images/mine_icon/icon_consumption.png',
                  width: 16.0,
                  height: 18.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text('消费记录'),
                )
              ],
            ),
            Image.asset(
              'images/icon_right.png',
              width: 10.0,
              height: 30.0,
            )
          ],
        ),
      ));

  var itemsPhone = GestureDetector(
      onTap: () {
        print('绑定手机');
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'images/mine_icon/icon_phone.png',
                  width: 16.0,
                  height: 18.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text('绑定手机'),
                )
              ],
            ),
            Image.asset(
              'images/icon_right.png',
              width: 10.0,
              height: 30.0,
            )
          ],
        ),
      ));

  var itemsServer = GestureDetector(
      onTap: () {
        print('联系客服');
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'images/mine_icon/icon_headset.png',
                  width: 16.0,
                  height: 18.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text('联系客服'),
                )
              ],
            ),
            Image.asset(
              'images/icon_right.png',
              width: 10.0,
              height: 30.0,
            )
          ],
        ),
      ));
}
