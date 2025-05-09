import 'dart:io';

import 'package:args/args.dart';
import 'package:password_manager/password_manager.dart';

// String version = Platform.version;

Future<void> main(List<String> arguments) async {
  await Future.wait([
    Password.initialize().then((_) => Password.updateListPass()),
  ]);
  if (arguments.isNotEmpty) {
    switch (arguments.first) {
      case '--help' || '-h':
        print('Usage: dart program.dart [command]');
        print('Commands:');
        print('  -getAllPass          List all passwords');
        print('  -createPass <name>   Create a new password for service');
        print('  -delete, -d <name>   Delete password for service');
        print('  --help, -h           Show this help message');
        print('  --version, -v        Show version');
        print('  --contacts, -c       Show contact information');
        print('  <name>               Get password for service');
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
