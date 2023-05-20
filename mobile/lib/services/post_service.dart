import 'package:mobile/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile/constant.dart';
import 'package:mobile/payload/request/post_request.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mobile/utils/SharedPrefsUtil.dart';
import 'package:mobile/payload/response/post_reponse.dart';

class PostService {
  Future<List<PostReponse>> fetchPosts() async {
    print("dô");
    final response = await http.get(Uri.parse(host + '/home'));
    print("haha" + response.statusCode.toString());
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      final posts =
          await Future.wait(data.map((json) => PostReponse.fromJson(json)));
      print("mmm");
      print(posts);
      return posts;
    } else {
      throw Exception('Failed to fetch post');
    }
  }

  Future<bool> uploadPost(PostRequest postRequest) async {
    try {
      var url = Uri.parse("http://localhost:3080/post-article");
      var request = http.MultipartRequest("POST", url);
      Future<String?> tokenFuture = SharedPrefsUtil.getToken();
      String? token = await tokenFuture;
      token ??= '';
      print(token);
      request.headers['x-access-token'] = token;
      request.fields['paragraph'] = postRequest.paragraph;
      request.files.add(await http.MultipartFile.fromBytes(
          'image', postRequest.selectedFile!,
          contentType: MediaType('application', 'json'),
          filename: "Any_name.jpg"));

      var response = await request.send();

      if (response.statusCode == 201) {
        print("File uploaded successfully");
        return true;
      } else {
        print('File upload failed');
        return false;
      }
    } catch (error) {
      print('Error occurred during file upload: $error');
      return false;
    }
  }
}
