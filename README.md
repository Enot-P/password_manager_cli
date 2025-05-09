🔒 Password Manager

A Secure, Local, Command-Line Password Management Solution

📖 Overview
Welcome to the Password Manager, a command-line application built with Dart to securely generate, store, and manage passwords for your services. Designed with simplicity and security in mind, this tool keeps all your sensitive data on your computer, encrypted with AES, and never sends it over the internet.
Your passwords are stored in a local passwords/ directory, protected by a 256-bit AES key. Whether you're creating strong passwords, retrieving them, or securely deleting them, this offline solution ensures your data stays private.
✨ Features

🔑 Generate Secure Passwords: Create strong, random passwords for any service.
💾 Local Storage: Store encrypted passwords in a local passwords/ directory.
🔍 Retrieve Passwords: Easily view passwords for specific services or list all.
🗑️ Delete Passwords: Securely remove passwords when no longer needed.
🖥️ Command-Line Interface: Simple and intuitive CLI for password management.
🔒 AES Encryption: Protect passwords with a 256-bit key and unique IVs.

🚀 Usage
Manage your passwords with simple commands:
dart program.dart [command]

Commands

Command
Description

-getAllPass
List all stored passwords in a table.

-createPass <name>
Create a new password for <name> and display it.

-delete, -d <name>
Delete the password for <name>.

<name>
Retrieve the password for <name>.

--help, -h
Show help with available commands.

--version, -v
Display the Dart version.

--contacts, -c
Show developer contact information.

Examples

Create a password:
dart program.dart -createPass gmail

Output:
Password successful added. Your new password "gmail":
kX9mPqW2nL5vJ8rT3zY6

List all passwords:
dart program.dart -getAllPass

Output:
name | password
------- | --------------------
gmail | kX9mPqW2nL5vJ8rT3zY6
github | aB2cD9eF6gH3jK8mN5pQ
2

Retrieve a password:
dart program.dart gmail

Output:
kX9mPqW2nL5vJ8rT3zY6

Delete a password:
dart program.dart -d github

Output:
Password successful deleted

🔐 Security
Your data's safety is our priority. Here's how the Password Manager keeps your passwords secure:
Security Features

Local Storage Only: Passwords are stored in the passwords/ directory on your computer. No data leaves your device, eliminating risks of remote attacks.
AES-256 Encryption: Passwords are encrypted with a 256-bit AES key, stored locally in passwords/encryption_key.bin, generated using a cryptographically secure random number generator.
Unique IVs: Each password uses a unique Initialization Vector (IV), ensuring identical passwords produce different ciphertexts.
Offline Operation: No network dependencies mean no exposure to internet-based vulnerabilities.

Security Considerations

Physical Access: Local storage means physical access to your device could compromise security. Use strong device passwords and consider full-disk encryption.
Key Storage: The encryption key is stored in plain text in passwords/encryption_key.bin. If this file is accessed, passwords could be decrypted. Restrict directory permissions.
Backups: Ensure any backups of the passwords/ directory are encrypted to prevent unauthorized access.
Malware: Local malware could access the passwords/ directory. Keep your system updated and use antivirus software.

Recommendations

🔒 Restrict directory permissions:chmod 700 passwords

💽 Enable full-disk encryption (e.g., FileVault, BitLocker, LUKS).
📦 Back up the passwords/ directory securely in an encrypted format.
🛡️ Regularly update your OS and run security scans.

⚠️ Limitations

Command-Line Only: No GUI, which may not suit all users.
Local Storage: No cross-device sync, prioritizing security over convenience.
Single Key: All passwords use one key. A compromised key risks all passwords. Future versions may explore per-password keys.

📬 Contact
Have questions or suggestions? Reach out:

Email: nikita.ptashkin2@gmail.com

📜 License
This project is licensed under the MIT License. See the LICENSE file for details.
