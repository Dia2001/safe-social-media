class RegisterRequest {
  final String id;
  final String name;
  final String email;
  final String password;
  final String avatar;
  final String phone;

  RegisterRequest({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
    required this.phone,
  });
}
