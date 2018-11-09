import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileManager {
  static Future<File> getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/conter.txt');
  }

  static Future<String> readCounter() async {
    try {
      File file = await getLocalFile();
      String contents = await file.readAsString();
      return contents;
    } on FileSystemException {
      return "";
    }
  }

  static Future<Null> incremenCounter(String msg) async {
    await (await getLocalFile()).writeAsString(msg,mode: FileMode.append);
  }
}
