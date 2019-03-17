import 'package:flutter/material.dart';

import 'package:flutter_app/data/book_shelf_top_data.dart';
import 'package:flutter_app/route_config/application.dart';

class CommentItemH extends StatelessWidget {
  final BookShelfTopData data;
  final BuildContext context;

  CommentItemH({Key key, this.context, this.data}) : super(key: key);

  Widget _createCommentItemH() {
    return GestureDetector(
        onTap: () {
          _onClik(context, data.bookId);
        },
        child: Row(
          children: <Widget>[
            Image.network(
              data.bookIconUrl,
              width: 42.0,
              height: 56.0,
            ),
            Column(
              children: <Widget>[
                Text(
                  data.bookName,
                  style: TextStyle(fontSize: 10.0, color: Colors.black45),
                ),
                Text(
                  data.bookAuthor,
                  style: TextStyle(fontSize: 8.0, color: Colors.black26),
                )
              ],
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
    return _createCommentItemH();
  }
}
