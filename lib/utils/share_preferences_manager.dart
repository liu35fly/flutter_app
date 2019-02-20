import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharePrefercencesManager {
  factory SharePrefercencesManager() => _getInstance();

  static SharePrefercencesManager get instance => _getInstance();
  static SharePrefercencesManager _instance;

  var sharePre;

  SharePrefercencesManager._internal() {
    sharePre = _getSharePre();
  }

  static SharePrefercencesManager _getInstance() {
    if (_instance == null) {
      _instance = new SharePrefercencesManager._internal();
    }
    return _instance;
  }

  _getSharePre() async {
    return await SharedPreferences.getInstance();
  }

  getSharePre()  {
    return  sharePre;
  }
}
