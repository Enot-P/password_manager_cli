import 'dart:io';

import 'package:args/args.dart';
import 'package:password_manager/password_manager.dart';

// String version = Platform.version;

Future<void> main(List<String> arguments) async {
  await Password.updateListPass();
  if (arguments.isNotEmpty) {
    switch (arguments.first) {
      case '--help' || '-h':
        print('TO-DO add help');
      case '--version' || '-v':
        print(Platform.version);
      case '--contacts' || '-c':
        print("Contacts\n");
        print('Email: nikita.ptashkin2@gmail.com');
      case '-getAllPass':
        Password.getAllPasswords();
      case '-createPass':
        if (arguments[1].isNotEmpty) {
          Password newPass = Password(service: arguments[1]);
          print(
            'Password successful added. Your new password "${newPass.name}":',
          );
          print(newPass.password);
        }
      case '-delete' || '-d':
        if (arguments[1].isNotEmpty) {
          Password newPass = Password(service: arguments[1]);
          newPass.deletePassword();
        }

      case _:
        print(Password.getPassword(arguments.first));
    }
  }
  exit(0);
}
