import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:pointycastle/asymmetric/api.dart';

Future<void> main() async {
  // File file = File("public.pem");
  // File file_2 = File("private.pem");
  // await file.create(recursive: true);
  // await file_2.create(recursive: true);

  // final publicKey = await parseKeyFromFile<RSAPublicKey>(file.path);
  // final privKey = await parseKeyFromFile<RSAPrivateKey>(file_2.path);

  // final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
  // final key = Key.fromUtf8('my 32 length key................');
  // final iv = IV.fromLength(16);

  // final encrypter = Encrypter(AES(key));

  // final encrypted = encrypter.encrypt(plainText, iv: iv);
  // final decrypted = encrypter.decrypt(encrypted, iv: iv);

  // print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  // print(
  //   encrypted.base64,
  // ); // R4PxiU3h8YoIRqVowBXm36ZcCeNeZ4s1OvVBTfFlZRdmohQqOO9EbgbrSwiq0EYz0aBdljHSC/rci2854Qa+nugbhKjidlezNplsEqOxR+pr1RtICZGAtv0YGevJBaRaHS17eHuj7GXo1CM3PR6pjGxrorcwR5Q7/bVEePESsimMbhHWF+AkDIX4v0CwKx9lgaTBgC8/yJKiLmQkyDCj64J3JSE=
  print(generateKey(100));
}

String generateKey(int length) {
  //33 - 122
  String result = "";
  const List<String> unusedPasswordSymbols = [
    '!',
    '@',
    '#',
    '\$',
    '%',
    '^',
    '*',
    '(',
    ')',
    '_',
    '+',
    '=',
    '-',
    '?',
    '.',
  ];

  for (int i = 0; i < length; i++) {
    String symbol;
    do {
      symbol = String.fromCharCode(Random().nextInt(89) + 33);
    } while (unusedPasswordSymbols.contains(symbol));
    result += symbol;
  }
  return result;
}
