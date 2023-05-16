import 'package:mobile/services/user_service.dart';

class PostReponse {
  final String id;
  final String user;
  final String text;
  final String image;
  final DateTime date;
  String nameUser;
  String avatarUser;

  PostReponse({
    required this.id,
    required this.user,
    required this.text,
    required this.image,
    required this.date,
    this.nameUser = '',
    this.avatarUser = '',
  });

  static Future<PostReponse> fromJson(Map<String, dynamic> json) async {
    final UserService _userService = UserService();
    final user = await _userService.fetchUser(json['user']);
    return PostReponse(
      id: json['_id'],
      user: json['user'],
      text: json['text'],
      image: json['image'],
      date: DateTime.parse(json['date']),
      nameUser: user.name ?? '',
      avatarUser: user.avatar ?? '',
    );
  }
}
