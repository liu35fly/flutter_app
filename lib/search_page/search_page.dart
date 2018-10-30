import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "搜索",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SearchPageState(),
    );
  }
}

class SearchPageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }
}

class SearchState extends State<SearchPageState> {



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

  Widget createTitle(){
    return Padding(padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0),
    child: Row(
      children: <Widget>[
        Expanded(child: Stack(children: <Widget>[

        ],))
      ],
    ));
  }

}
