import 'package:flutter/material.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';

class ProfileController {
  final username = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();

  Map<String, String> _initialData = {};
  bool isChanged = false;
  bool isInitialized = false;

  void fillFromUser(UserEntity user) {
    final newData = {
      "username": user.username ?? "",
      "firstName": user.firstName ?? "",
      "lastName": user.lastName ?? "",
      "email": user.email ?? "",
      "phone": user.phone ?? "",
    };

    if (_isSameData(newData, _initialData)) return;

    username.text = newData["username"]!;
    firstName.text = newData["firstName"]!;
    lastName.text = newData["lastName"]!;
    email.text = newData["email"]!;
    phone.text = newData["phone"]!;

    _initialData = newData;
    isChanged = false;
    isInitialized = true;
  }

  bool _isSameData(Map<String, String> a, Map<String, String> b) {
    if (a.length != b.length) return false;

    for (final key in a.keys) {
      if (a[key] != b[key]) return false;
    }
    return true;
  }

  bool checkChanges() {
    if (!isInitialized) return false;

    isChanged =
        username.text != _initialData["username"] ||
        firstName.text != _initialData["firstName"] ||
        lastName.text != _initialData["lastName"] ||
        email.text != _initialData["email"] ||
        phone.text != _initialData["phone"];

    return isChanged;
  }

  void dispose() {
    username.dispose();
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phone.dispose();
  }
}
