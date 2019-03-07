import 'dart:typed_data';
import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;

class AESUtils {
  var keys = '';
  var ivs = '';

  Future<String> decryptData(String content) async {
    final key = encrypt.Key.fromUtf8(keys);
    final iv = encrypt.IV(Uint8List.fromList(utf8.encode(ivs)));

    var encrypter =
        encrypt.Encrypter(encrypt.AES(key, iv, mode: encrypt.AESMode.cbc));
    String decrypted = encrypter.decrypt64(content);
    return decrypted;
  }

  Future<String> encryptData(String content) async {
    final key = encrypt.Key.fromUtf8(keys);
    final iv = encrypt.IV(Uint8List.fromList(utf8.encode(ivs)));

    var encrypter =
        encrypt.Encrypter(encrypt.AES(key, iv, mode: encrypt.AESMode.cbc));
    var encrypted = encrypter.encrypt(content);
//    print(encrypted
//        .base64);
    return encrypted.base64;
  }
}
