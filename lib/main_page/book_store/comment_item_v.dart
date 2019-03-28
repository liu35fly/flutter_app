import 'package:flutter/material.dart';

import 'package:flutter_app/data/book_shelf_top_data.dart';
import 'package:flutter_app/route_config/application.dart';

class CommentItemV extends StatelessWidget {
  final BookShelfTopData data;
  final BuildContext context;

  CommentItemV({Key key,this.context, this.data}) : super(key:key);

  Widget _createCommentItemV() {
    return  GestureDetector(
        onTap: () {
          _onClik(context, data.bookId);
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              data.bookIconUrl,
              width: 74.0,
              height: 96.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                data.bookName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13.0, color: Colors.black,decoration: TextDecoration.none,fontWeight:FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                data.bookAuthor,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10.0, color: Colors.black26,decoration: TextDecoration.none,fontWeight:FontWeight.normal ),
              ),
            )
          ],
        ));
  }

  void _onClik(BuildContext context, int bookId) {
    Application.router
        .navigateTo(context, "/detailPage?bookId=$bookId", clearStack: false);
  }

  @override
  Widget build(BuildContext context) {
    return _createCommentItemV();
  }
}
