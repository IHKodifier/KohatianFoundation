enum UserRole {
  cadet,
  entryCoordinator,
  admin,
}

class AppUser {
  final String uuid;
  final String name;
  final String email;
  String? password;
  final bool isValidated;
  List<UserRole> roles;

  AppUser(
      {required this.uuid,
      required this.name,
      required this.email,
      this.isValidated = false,
      this.roles = const  [UserRole.cadet],
      });
}
