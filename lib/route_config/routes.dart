import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/route_config/route_handlers.dart';

class Routes {
  static String root = "/";
  static String checkGender = "/check";
  static String mainPage = "/mainPage";
  static String echargePage = "/echargePage";
  static String loginPage = "/loginPage";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
//    router.define(root, handler: rootHandler);
    router.define(checkGender, handler: rootHandler);
    router.define(mainPage, handler: mainPageHandler);
    router.define(echargePage, handler: echargePageHandler);
    router.define(loginPage, handler: loginPageHandler);
  }
}
