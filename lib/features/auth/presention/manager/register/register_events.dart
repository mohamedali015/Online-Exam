sealed class RegisterEvents {}

class RegisterValidateForm extends RegisterEvents {
  final bool markSubmitted;
  RegisterValidateForm({this.markSubmitted = false});
}

class RegisterSubmitted extends RegisterEvents {
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;

  RegisterSubmitted({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
  });
}
