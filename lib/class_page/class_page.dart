import 'package:flutter/material.dart';

class BookClassPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class BookClassState extends State<BookClassPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

  Widget createItem() {
//    return Card(child:,);
  }

  Widget createIcons() {
    return Stack(children: <Widget>[
      Row(children: <Widget>[
        Image.network("", width: 57.0, height: 77.0,),
        Image.network("", width: 57.0, height: 77.0,)
      ],),
      Image.network("", width: 71.0, height: 94.0)
    ],);
  }
}