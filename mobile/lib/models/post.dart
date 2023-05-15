// import 'package:mobile/services/user_service.dart';

// class Post {
//   final String id;
//   final String user;
//   final String text;
//   final String image;
//   final DateTime date;
//   // final String nameUser;
//   // final String avatarUser;

//   Post({
//     required this.id,
//     required this.user,
//     required this.text,
//     required this.image,
//     required this.date,
//     // required this.nameUser,
//     // required this.avatarUser,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) {
//     // print(json['_id']);
//     // print(json['user']);
//     // print(json['text']);
//     // print(json['image']);
//     // print(json['date']);
//     return Post(
//       id: json['_id'],
//       user: json['user'],
//       text: json['text'],
//       image: json['image'],
//       date: DateTime.parse(json['date']),
//       // nameUser: '',
//       // avatarUser: ''
//     );
//   }
// }
import 'package:mobile/services/user_service.dart';

class Post {
  final String id;
  final String user;
  final String text;
  final String image;
  final DateTime date;
  String nameUser;
  String avatarUser;

  Post({
    required this.id,
    required this.user,
    required this.text,
    required this.image,
    required this.date,
    this.nameUser = '',
    this.avatarUser = '',
  });

  static Future<Post> fromJson(Map<String, dynamic> json) async {
    final UserService _userService = UserService();
    final user = await _userService.fetchUser(json['user']);
    return Post(
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
