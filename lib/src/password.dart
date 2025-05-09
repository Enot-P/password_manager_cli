import 'dart:io';
import 'dart:math' show Random;

import 'package:crypto/crypto.dart';

class Password {
  late String _password;
  get password => _password;
  final String service;
  static List<Password> listPass = [];

  Password._({required this.service, required String password})
    : _password = password;

  factory Password({required service}) {
    final newPassword = Password._(
      service: service,
      password: _generateKey(20),
    );
    listPass.add(newPassword);
    return newPassword;
  }

  static getPasswords() async {
    Directory passDir = Directory('passwords');
    try {
      await for (var entity in passDir.list()) {
        File pass = File(entity.path);
        String passContent = await pass.readAsString();
        listPass.add(
          Password._(service: entity.path.substring(10), password: passContent),
        );
      }
    } catch (ex) {
      print(ex);
    }
    print("name\t| password");
    print("${'-' * 7} | ${'-' * 20}");
    listPass.forEach(print);
    print(listPass.length);
  }

  void updatePassword() {}

  void deletePassword() {}

  Future<void> _savePassword() async {
    File filePass = File('passwords/${this.service}');
    Future.microtask(() {
      filePass.create(recursive: true);
    });
    filePass.writeAsString(this._password);
  }

  static String _generateKey(int length) {
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

  void encryptPassword() {}
  void decryptPassword() {}

  @override
  String toString() {
    return "$service\t| $_password";
  }
}
