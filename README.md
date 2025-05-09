# English verison

![Dart Badge](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white) ![Password Manager Badge](https://img.shields.io/badge/Password%20Manager-Secure-2EA44F?style=for-the-badge)

# 🔒 Password Manager

## 📖 Description

**Password Manager** is a command-line application written in Dart for securely creating, storing, and managing passwords. All data is stored locally and encrypted with AES-256, with nothing sent over the internet.

## ✨ Features

- 🔑 Generate secure passwords
- 💾 Local storage
- 🔍 Retrieve passwords
- 🗑️ Delete passwords
- 🖥️ Convenient CLI
- 🔒 AES-256 encryption

## ⚙️ Build

To compile the project into an `.exe` file (for example, `manpass.exe`), run:

```bash
dart compile exe program.dart -o manpass.exe
```

After this, `manpass.exe` will appear in the folder.

## 🚀 Usage

Run the program via the `.exe` file:

```bash
manpass.exe [command]
```

## 📚 Commands

| Command              | Description                                       |
| -------------------- | ------------------------------------------------- |
| `-getAllPass`        | Show all saved passwords in a table               |
| `-createPass <name>` | Create a new password for `<name>` and display it |
| `-delete, -d <name>` | Delete the password for `<name>`                  |
| `<name>`             | Retrieve the password for `<name>`                |
| `--help, -h`         | Show help information                             |
| `--version, -v`      | Show Dart version                                 |
| `--contacts, -c`     | Developer contact information                     |

## 💡 Examples

- **Create a password**:
  ```bash
  manpass.exe -createPass gmail
  ```
- **Show all passwords**:
  ```bash
  manpass.exe -getAllPass
  ```
- **Retrieve a password**:
  ```bash
  manpass.exe gmail
  ```
- **Delete a password**:
  ```bash
  manpass.exe -d github
  ```

## 🔐 Security

- Local storage (`passwords/` folder)
- AES-256 encryption with unique IV
- Fully offline

## 📬 Contacts

- **Email**: [nikita.ptashkin2@gmail.com](mailto:nikita.ptashkin2@gmail.com)

## 📜 License

MIT License. See LICENSE for details.

---

# Русская версия

# 🔒 Менеджер паролей

## 📖 Описание

**Password Manager** — это командное приложение на Dart для безопасного создания, хранения и управления паролями. Все данные хранятся локально и шифруются AES-256, ничего не отправляется в интернет.

## ✨ Features

- 🔑 Создание безопасных паролей
- 💾 Локальное хранилище
- 🔍 Получение паролей
- 🗑️ Удаление паролей
- 🖥️ Удобный CLI
- 🔒 AES-256 шифрование

## ⚙️ Сборка

Чтобы собрать проект в `.exe` файл (например, `manpass.exe`), выполни:

```bash
dart compile exe program.dart -o manpass.exe
```

После этого в папке появится `manpass.exe`.

## 🚀 Использование

Запускай программу через `.exe` файл:

```bash
manpass.exe [команда]
```

## 📚 Команды

| Команда             | Описание                                        |
| ------------------- | ----------------------------------------------- |
| `-getAllPass`       | Показать все сохранённые пароли таблицей        |
| `-createPass <имя>` | Создать новый пароль для `<имя>` и показать его |
| `-delete, -d <имя>` | Удалить пароль для `<имя>`                      |
| `<имя>`             | Получить пароль для `<имя>`                     |
| `--help, -h`        | Показать справку                                |
| `--version, -v`     | Показать версию Dart                            |
| `--contacts, -c`    | Контактная информация разработчика              |

## 💡 Примеры

- **Создать пароль**:
  ```bash
  manpass.exe -createPass gmail
  ```
- **Показать все пароли**:
  ```bash
  manpass.exe -getAllPass
  ```
- **Получить пароль**:
  ```bash
  manpass.exe gmail
  ```
- **Удалить пароль**:
  ```bash
  manpass.exe -d github
  ```

## 🔐 Безопасность

- Локальное хранение (папка `passwords/`)
- AES-256 шифрование с уникальными IV
- Полностью оффлайн

## 📬 Контакты

- **Email**: [nikita.ptashkin2@gmail.com](mailto:nikita.ptashkin2@gmail.com)

## 📜 Лицензия

MIT License. Подробнее в LICENSE.
