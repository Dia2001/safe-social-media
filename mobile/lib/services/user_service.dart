import 'package:mobile/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile/constant.dart';

class UserService {
  Future<User> fetchUser(String userId) async {
    final response =
        await http.get(Uri.parse(host + '/api/v1/users/' + userId));

    if (response.statusCode == 200) {
      // Nếu API trả về mã 200 OK
      return User.fromJson(jsonDecode(response.body));
    } else {
      // Nếu API trả về mã lỗi
      throw Exception('Failed to load user');
    }
  }
}
