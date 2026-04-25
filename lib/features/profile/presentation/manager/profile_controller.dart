import 'package:flutter/material.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';

class ProfileController {
  final username = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();

  Map<String, String> _originalData = {};
  bool hasChanges = false;
  bool isInitialized = false;

  /// بدل fillFromUser
  void initializeFromUser(UserEntity user, {bool force = false}) {
    final newData = {
      "username": user.username ?? "",
      "firstName": user.firstName ?? "",
      "lastName": user.lastName ?? "",
      "email": user.email ?? "",
      "phone": user.phone ?? "",
    };

    if (!force && _isSameProfileData(newData, _originalData)) return;

    username.text = newData["username"]!;
    firstName.text = newData["firstName"]!;
    lastName.text = newData["lastName"]!;
    email.text = newData["email"]!;
    phone.text = newData["phone"]!;

    _originalData = newData;
    hasChanges = false;
    isInitialized = true;
  }

  /// بدل _isSameData
  bool _isSameProfileData(Map<String, String> a, Map<String, String> b) {
    if (a.length != b.length) return false;

    for (final key in a.keys) {
      if (a[key] != b[key]) return false;
    }
    return true;
  }

  /// بدل checkChanges
  bool updateChangeStatus() {
    if (!isInitialized) return false;

    hasChanges =
        username.text != _originalData["username"] ||
        firstName.text != _originalData["firstName"] ||
        lastName.text != _originalData["lastName"] ||
        email.text != _originalData["email"] ||
        phone.text != _originalData["phone"];

    return hasChanges;
  }

  void dispose() {
    username.dispose();
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phone.dispose();
  }
}
