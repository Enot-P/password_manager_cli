import 'dart:math';

import 'package:encrypt/encrypt.dart';

void main(List<String> args) {
  final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
  final key = Key.fromUtf8(_generateKey(32));
  print(_generateKey(32));
  final iv = IV.fromLength(16);

  final encrypter = Encrypter(AES(key));

  final encrypted = encrypter.encrypt(plainText, iv: iv);
  final decrypted = encrypter.decrypt(encrypted, iv: iv);

  print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  print(encrypted.base64);
}

String _generateKey(int length) {
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
