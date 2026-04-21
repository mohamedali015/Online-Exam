import 'package:flutter/material.dart';

class ProfileController {
  final username = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();

  Map<String, String> initialData = {};
  bool isChanged = false;

  void fillFromUser(user) {
    username.text = user.username ?? "";
    firstName.text = user.firstName ?? "";
    lastName.text = user.lastName ?? "";
    email.text = user.email ?? "";
    phone.text = user.phone ?? "";

    initialData = {
      "username": username.text,
      "firstName": firstName.text,
      "lastName": lastName.text,
      "email": email.text,
      "phone": phone.text,
    };

    isChanged = false;
  }

  void dispose() {
    username.dispose();
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phone.dispose();
  }

  bool checkChanges() {
    isChanged =
        username.text != initialData["username"] ||
        firstName.text != initialData["firstName"] ||
        lastName.text != initialData["lastName"] ||
        email.text != initialData["email"] ||
        phone.text != initialData["phone"];

    return isChanged;
  }
}
