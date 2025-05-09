import 'package:args/args.dart';
import 'package:password_manager/password_manager.dart';

const String version = '0.0.1';

void main(List<String> arguments) {
  var pass = Password(service: "new");

  //pass.generatePassword();
  print(Password.getPasswords());
}
