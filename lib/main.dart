import 'package:flutter/material.dart';

import 'package:flutter_app/welcome_page/splash_page.dart';
import 'package:flutter_app/main_page/book_store/book_store_week_group.dart';
import 'package:flutter_app/main_page/book_store/book_store_male_group.dart';
import 'package:flutter_app/class_page/class_page.dart';

void main() => runApp(new MaterialApp(
    title: '我的测试',
//      home: new SplashPage(),
//    home: WeekGroup()
//    home: BookClassPage()
    home: MaleGroup()
));
