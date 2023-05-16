import 'dart:html';

import 'package:mobile/models/like.dart';
import 'package:mobile/models/comment.dart';

class Post {
  final String id;
  final String user;
  final String text;
  final String image;
  final List<Like> likes;
  final List<Comment> comments;
  final DateTime date;
  final int v;

  Post(
      {required this.id,
      required this.user,
      required this.text,
      required this.image,
      required this.likes,
      required this.comments,
      required this.date,
      required this.v});
}
