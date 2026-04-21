sealed class UpdateProfileEvents {}

class UpdateProfile extends UpdateProfileEvents {
  final String? username;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;

  UpdateProfile({
    this.username,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
  });
}
