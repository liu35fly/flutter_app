import 'dart:async';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_app/detail_page/book_detail_page.dart';

class BannerWidget extends StatefulWidget {
  final List<String> images;

  BannerWidget(this.images, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BannerWidgetState();
  }
}

class _BannerWidgetState extends State<BannerWidget> {
  final pageController = PageController(initialPage: 0);

  Timer timer;

  void resetTimer() {
    clearTimer();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (pageController.positions.isNotEmpty) {
        var i = pageController.page.toInt() + 1;
        pageController.animateToPage(i,
            duration: Duration(milliseconds: 100), curve: Curves.linear);
        if (i == widget.images.length) {
          pageController.jumpToPage(0);
          i = 0;
        }
      }
    });
  }

  void clearTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  @override
  void initState() {
    super.initState();
    resetTimer();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.length == 0) {
      return null;
    }
    return SizedBox(
      height: 187.0,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
          controller: pageController,
          physics: PageScrollPhysics(parent: ClampingScrollPhysics()),
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            final url = widget.images[index];
            return FlatButton(
              child: new Image(
                image: AssetImage("images/icon_banner.jpg"),
                width: 360.0,
                height: 187.0,
                fit: BoxFit.fill,
              ),
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "banner",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Color(0xe74c3c),
                    textColor: Color(0xffffff));
                Navigator
                    .push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new BookDetailPage(
//                        data: BookData(
//                            'http://bookapp.dtbooking.com//image/%E5%A5%B9%E6%AF%94%E7%83%9F%E8%8A%B1%E8%BF%98%E8%80%80%E7%9C%BC.jpg',
//                            '书库'),
                        bookId: "0",
                      )),
                )
                    .then((value) {});
              },
            );
          }),
    );
  }

  @override
  void dispose() {
    clearTimer();
    super.dispose();
  }

}
