import 'dart:convert';
import 'dart:io';
import 'dart:math' show Random;
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';

class Password {
  late String _password;
  static late final Key _key;
  late IV _iv;
  static final Directory _passDir = Directory('passwords');
  static final List<Password> _listPass = [];
  late String _encryptedData; // храним зашифрованные данные как base64 строку
  get password => _password;
  static get passDir => _passDir;
  final String name;

  // Статический блок инициализации для _key
  static Future<void> initialize() async {
    _key = await _loadOrCreateKey();
  }

  Password._({required this.name, required String password})
    : _password = password;

  factory Password({required service}) {
    _key = _loadOrCreateKey() as Key;
    final newPassword = Password._(name: service, password: _generateKey(20));
    newPassword._savePassword();
    _listPass.add(newPassword);
    return newPassword;
  }

  static Key _generateRandomKey() {
    final rand = Random.secure();
    final keyBytes = Uint8List(32); // 256-битный ключ для AES
    for (int i = 0; i < keyBytes.length; i++) {
      keyBytes[i] = rand.nextInt(256);
    }
    return Key(keyBytes);
  }

  static Future<Key> _loadOrCreateKey() async {
    final keyFile = File('${_passDir.path}/encryption_key.bin');
    if (!await _passDir.exists()) {
      await _passDir.create(recursive: true);
    }
    if (await keyFile.exists()) {
      final keyBytes = await keyFile.readAsBytes();
      return Key(keyBytes);
    } else {
      final key = _generateRandomKey();
      await keyFile.writeAsBytes(key.bytes);
      return key;
    }
  }

  //
  static updateListPass() async {
    _passDir.create(recursive: true);
    try {
      await for (var entity in _passDir.list()) {
        if (entity is! File) continue;
        String passContent = await (entity).readAsString();

        Password component = Password._(
          name: entity.path.split('\\').last,
          password: '',
        );
        component._encryptedData = passContent;
        component.decryptPassword();
        print("component: $component");
        if (!_listPass.contains(component)) {
          _listPass.add(component);
        }
      }
    } catch (ex) {
      print(ex);
    }
  }

  void deletePassword() {
    try {
      decryptPassword();
      _listPass.removeWhere((item) => item.name == name);
      if (_listPass.isEmpty) {
        print("There is no such password");
        return;
      }
      File filePass = File('${_passDir.path}/${name}');
      filePass.delete();
      print("Password successful deleted");
    } catch (e) {
      print("Error delete password: $e");
    }
  }

  void encryptPassword() {
    _iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(_key));
    final encrypted = encrypter.encrypt(_password, iv: _iv);

    final combined = [..._iv.bytes, ...encrypted.bytes];
    _encryptedData = base64.encode(combined);
  }

  void decryptPassword() {
    try {
      final combined = base64.decode(_encryptedData);
      _iv = IV(Uint8List.fromList(combined.sublist(0, 16)));
      final encrypted = Encrypted(Uint8List.fromList(combined.sublist(16)));
      final encrypter = Encrypter(AES(_key));
      _password = encrypter.decrypt(encrypted, iv: _iv);
    } catch (e) {
      print("Error in decrypt: $e");
    }
  }

  static String getPassword(String name) {
    return _listPass.where((e) => e.name == name).first._password;
  }

  static getAllPasswords() async {
    print("name\t| password");
    print("${'-' * 7} | ${'-' * 20}");
    _listPass.forEach(print);
    print(_listPass.length);
  }

  Future<void> _savePassword() async {
    encryptPassword();
    File filePass = File('${_passDir.path}/${name}');
    await filePass.create(recursive: true);
    filePass.writeAsString(_encryptedData);
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

  @override
  String toString() {
    return "$name\t| $_password";
  }
}
