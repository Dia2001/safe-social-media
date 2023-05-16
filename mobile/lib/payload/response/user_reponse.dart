class UserResponse {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String phone;

  UserResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.phone,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      phone: json['phone'],
    );
  }
}
