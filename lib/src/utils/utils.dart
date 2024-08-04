import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

/// utils
class Utils {
  /// 对字符串进行md5
  static String generateMd5(String input) {
    if (input == '') {
      return '';
    }
    var bytes = utf8.encode(input);
    var digest = md5.convert(bytes);
    return digest.toString();
  }

  /// 对字符串进行base64编码
  static String base64encode(String input) {
    if (input == '') {
      return '';
    }
    return base64Encode(utf8.encode(input));
  }

  /// 对字符串进行base64解码
  static String base64decode(String input) {
    if (input == '') {
      return '';
    }
    return utf8.decode(base64Decode(input));
  }

  /// 对字符串进行url编码
  static String urlEncodeComponent(String input) {
    if (input == '') {
      return '';
    }
    return Uri.encodeComponent(input).toString();
  }

  /// 对字符串进行url解码
  static String urlDecodeComponent(String input) {
    if (input == '') {
      return '';
    }
    return Uri.decodeComponent(input).toString();
  }

  /// aes加密
  static String aesEncode(String input, String key, String iv) {
    try {
      if (input == '') {
        return '';
      }
      final k = Key.fromUtf8(key);
      final i = IV.fromUtf8(iv);
      final encrypter = Encrypter(AES(k, mode: AESMode.cbc, padding: null));
      final encrypted = encrypter.encrypt(input, iv: i);
      return encrypted.base64;
    } catch (e, stackTrace) {
      return '';
    }
  }

  /// aes解密
  static String aesDecode(String input, String key, String iv) {
    try {
      if (input == '') {
        return '';
      }
      final k = Key.fromUtf8(key);
      final i = IV.fromUtf8(iv);
      final encrypter = Encrypter(AES(k, mode: AESMode.cbc, padding: null));
      final decrypted = encrypter.decrypt64(input, iv: i);
      return decrypted;
    } catch (e, stackTrace) {
      return '';
    }
  }
}
