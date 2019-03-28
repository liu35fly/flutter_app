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
            Container(
                width: 120.0,
                padding: const EdgeInsets.only(
                    left: 15.0, top: 15.0, right: 15.0),
                child: Column(
//                      mainAxisSize: MainAxisSize.max,
//                      crossAxisAlignment: CrossAxisAlignment.stretch,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.bookName,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black45,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      data.bookAuthor,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.black26,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ))
          ],
        )
    );
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
