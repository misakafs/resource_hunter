import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

/// utils
class Utils {
  /// 对字符串进行md5
  static String generateMd5(String input) {
    var bytes = utf8.encode(input);
    var digest = md5.convert(bytes);
    return digest.toString();
  }

  /// 对字符串进行url编码
  static String urlEncodeComponent(String input) {
    return Uri.encodeComponent(input).toString();
  }

  /// aes加密
  static String aesEncode(String input, String key, String iv) {
    try {
      final k = Key.fromUtf8(key);
      final i = IV.fromUtf8(iv);
      final encrypter = Encrypter(AES(k, mode: AESMode.cbc, padding: null));
      final encrypted = encrypter.encrypt(input, iv: i);
      return encrypted.base64;
    } catch (e, stackTrace) {
      log('aes encode failed', e, stackTrace);
    }
    return '';
  }

  /// aes解密
  static String aesDecode(String input, String key, String iv) {
    try {
      final k = Key.fromUtf8(key);
      final i = IV.fromUtf8(iv);
      final encrypter = Encrypter(AES(k, mode: AESMode.cbc, padding: null));
      final decrypted = encrypter.decrypt64(input, iv: i);
      return decrypted;
    } catch (e, stackTrace) {
      log('aes decode failed', e, stackTrace);
    }
    return '';
  }

  /// print log
  static void log(String message, [Object? e, StackTrace? stackTrace]) {
    print('$message:\n$e\n$stackTrace');
  }
}
