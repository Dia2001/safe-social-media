import 'package:mobile/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile/constant.dart';

class PostService {
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(host + '/home'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      //final posts = data.map((json) => Post.fromJson(json)).toList();
      final posts = await Future.wait(data.map((json) => Post.fromJson(json)));
      return posts;
    } else {
      throw Exception('Failed to fetch post');
    }
  }
}
