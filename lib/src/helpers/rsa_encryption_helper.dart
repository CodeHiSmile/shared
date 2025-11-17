import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pointycastle/pointycastle.dart' as pointycastle;

class RSAEncryptionHelper {
  const RSAEncryptionHelper._();

  static Future<String> encrypt(Object? object) async {
    final plainText = jsonEncode(object);
    final publicKeyPem = await rootBundle.loadString('assets/public_key.pem');

    final parser = RSAKeyParser();
    pointycastle.RSAPublicKey publicKey;

    try {
      publicKey = parser.parse(publicKeyPem) as pointycastle.RSAPublicKey;
    } catch (e) {
      if (kDebugMode) {
        print('Error parsing public key: $e');
      }
      return '';
    }

    final encrypter = Encrypter(RSA(publicKey: publicKey));
    final encrypted = encrypter.encrypt(plainText);

    if (kDebugMode) {
      print(encrypted.base64);
    }
    return encrypted.base64;
  }
}
