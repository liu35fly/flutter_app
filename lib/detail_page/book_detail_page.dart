import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class BookData {
  final String url;
  final String name;

  BookData(this.url, this.name);
}

class BookDetailPage extends StatefulWidget {
//  final BookData data;

//  BookDetailPage({Key key, @required this.data}) : super(key: key);

  final String bookId;

  BookDetailPage({Key key, this.bookId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BookDetailHome();
  }
}

class BookDetailHome extends State<BookDetailPage> {
//   var icon = FadeInImage.memoryNetwork(
//    placeholder: kTransparentImage,
//    fit: BoxFit.contain,
//    image:data.url,
////        "http://bookapp.dtbooking.com//image/%E5%A5%B9%E6%AF%94%E7%83%9F%E8%8A%B1%E8%BF%98%E8%80%80%E7%9C%BC.jpg",
//    width: 95.0,
//    height: 127.0,
//  );

//  var title = Row(
//    children: <Widget>[
//      icon,
//      Column(
//        children: <Widget>[
//          Text(
//            '年年岁岁',
//            style: new TextStyle(color: Colors.black, fontSize: 18.0),
//          ),
//          RichText(
//            text: new TextSpan(text: '类型:', children: <TextSpan>[
//              new TextSpan(
//                  text: '都市', style: new TextStyle(color: Colors.green))
//            ]),
//          ),
//          RichText(
//            text: new TextSpan(text: '状态:', children: <TextSpan>[
//              new TextSpan(
//                  text: '完结', style: new TextStyle(color: Colors.green))
//            ]),
//          )
//        ],
//      )
//    ],
//  );

  var data;

  var title;

  var btns = Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Material(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 50.0, right: 50.0, bottom: 15.0),
                color: Colors.green,
                child: Text(
                  '加入书架',
                  style: new TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              ))),
      Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Material(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 50.0, right: 50.0, bottom: 15.0),
                color: Colors.redAccent,
                child: Text(
                  '免费试读',
                  style: new TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              )))
    ],
  );

  var tip1 = Row(
    children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(top: 29.0),
          child: Image.asset(
            'images/detail_icon/icon_green_info.png',
            width: 17.0,
            height: 16.0,
          )),
      Padding(
          padding: const EdgeInsets.only(top: 29.0, left: 10.0),
          child: Text(
            '内容简介',
            style: TextStyle(fontSize: 18.0, color: Colors.green),
          ))
    ],
  );

  var tip2 = RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.grey),
        text:
        '&nbsp;&nbsp;&nbsp;&nbsp;和班主任整整聊了三节晚自习，一直到放学回家，我都还没有从震惊和激动的情绪中缓和过来，脑子里全是班主任那性感撩人的模样，一晚上都没睡着。<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;第二天早上，毫无悬念的迟到了，早读开始了我才到学校，一进教室，全班同学都在盯着我看，弄的我特别尴尬。<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;我在心里下定决心，一定要改变自己，不能让别人看不起我！<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;上午第一节课是语文课，上课铃声刚一响起，班主任颜如玉就拿着教材，踩着高跟鞋哒哒哒的从外面走了进来。<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;她今天穿着一条黑色的七分裤，搭配着白色的衬衫，身材高挑性感，美腿笔直修长，浑身散发着女神气质。<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;我看到班主任那冰山女神的样子，不禁想起昨晚上她发给我的那两张自拍照，心头又是一阵火热。<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;班主任走进教室，放下教材就说道：“上课之前，同学们先把昨天我布置的作业拿出来放到桌子上，我现在要检查！”<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;她的话音刚落，我的脑袋里面瞬间嗡的一声，有种大事不妙的感觉。<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;昨晚上一直在和班主任聊微信，她布置的作业我压根就没做，万万没想到，她竟然会在这个时候抽查作业！<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;',
      ));

  var tip3 = Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '查看目录',
                style: TextStyle(color: Colors.green, fontSize: 16.0),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23.0),
                child: Text(
                  '共1024章',
                  style: TextStyle(color: Colors.grey[500], fontSize: 16.0),
                ),
              )
            ],
          ),
          Image.asset(
            'images/icon_right.png',
            width: 7.0,
            height: 13.0,
          ),
        ],
      ));

  var tip4 = Row(
    children: <Widget>[
      RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
              text: '最新章节: ',
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: '第1022章 青春不再(三更)',
                    style: TextStyle(color: Colors.grey))
              ]))
    ],
  );

  var tip5 = Padding(
      padding: const EdgeInsets.only(top: 46.0),
      child: Row(
        children: <Widget>[
          Image.asset(
            'images/detail_icon/icon_green_book.png',
            width: 14.0,
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0),
            child: Text(
              '好书连连',
              style: TextStyle(color: Colors.green, fontSize: 18.0),
            ),
          )
        ],
      ));

  //buildListTile相当于ListView的Adapter
  Widget buildListTile(int i) {
    return Padding(padding: const EdgeInsets.all(5.0), child: Column(
      children: <Widget>[
        Image.asset(
          'images/main_icon/icon_demo.jpg',
          width: 101.0,
          height: 134.0,
        ),
        Padding(
          child: Text(
            '千里之行$i',
            style: TextStyle(color: Colors.grey),
          ),
          padding: const EdgeInsets.only(top: 10.0),
        ),
      ],
    ));

//    return new ListTile(
//      isThreeLine: false,//子item的是否为三行
//      dense: false,
//      leading: new CircleAvatar(child: new Text(item),),//左侧首字母图标显示，不显示则传null
//      title: new Text('子item的标题'),//子item的标题
//      subtitle: new Text('子item的内容'),//子item的内容
//      trailing: new Icon(Icons.arrow_right,color: Colors.green,),//显示右侧的箭头，不显示则传null
//    );
  }

  @override
  void initState() {
    super.initState();

    data = widget.bookId;

    title = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          fit: BoxFit.contain,
          image: data.url,
          width: 95.0,
          height: 127.0,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      data.name,
                      style: new TextStyle(color: Colors.black, fontSize: 18.0),
                    )),
                RichText(
                  text: new TextSpan(
                      text: '类型:',
                      style: new TextStyle(color: Colors.grey),
                      children: <TextSpan>[
                        new TextSpan(
                            text: '都市',
                            style: new TextStyle(color: Colors.green))
                      ]),
                ),
                RichText(
                  text: new TextSpan(
                      text: '状态:',
                      style: new TextStyle(color: Colors.grey),
                      children: <TextSpan>[
                        new TextSpan(
                            text: '完结',
                            style: new TextStyle(color: Colors.green))
                      ]),
                )
              ],
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '书籍详情',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    title,
                    btns,
                    tip1,
                    tip2,
                    tip3,
                    tip4,
                    tip5,
                    Container(
                        height: 200.0,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(10.0),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, i) {
                            return buildListTile(i);
                          },
                        ))
                  ],
                ))));
  }
}
