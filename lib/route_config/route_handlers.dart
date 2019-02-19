import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/welcome_page/check_gender.dart';
import 'package:flutter_app/main_page/main_page.dart';
import 'package:flutter_app/mine_page/echarge_page.dart';
import 'package:flutter_app/login_page/LoginPage.dart';
import 'package:flutter_app/detail_page/book_detail_page.dart';
import 'package:flutter_app/rank_page/rank_page.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new CheckGenderHome();
});

var mainPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String message = params["message"]?.first;
//      String colorHex = params["color_hex"]?.first;
//      String result = params["result"]?.first;
//      Color color = new Color(0xFFFFFFFF);
  return new MainPage();
});

var echargePageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new EchargePage();
});

var loginPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new LoginPage();
});
var detailPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String message = params["bookId"]?.first;
//      String colorHex = params["color_hex"]?.first;
//      String result = params["result"]?.first;
//      Color color = new Color(0xFFFFFFFF);
  return new BookDetailPage(bookId: message);
});
var rankPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  int message = int.parse(params["type"]?.first);
//      String colorHex = params["color_hex"]?.first;
//      String result = params["result"]?.first;
//      Color color = new Color(0xFFFFFFFF);
  return new RankPageHome(type: message);
});
