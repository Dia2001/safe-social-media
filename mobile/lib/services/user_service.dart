import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile/constant.dart';
import 'package:mobile/payload/request/register_request.dart';
import 'package:mobile/payload/response/user_reponse.dart';
import 'package:mobile/payload/request/user_edit_request.dart';

class UserService {
  Future<UserResponse> fetchUser(String userId) async {
    final response =
        await http.get(Uri.parse(host + '/api/v1/users/' + userId));

    if (response.statusCode == 200) {
      return UserResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<String?> register(RegisterRequest registerRequest) async {
    final body = {
      'email': registerRequest.email,
      'password': registerRequest.password,
      'name': registerRequest.name,
      'phone': registerRequest.phone
    };
    final response = await http.post(Uri.parse(host + '/api/v1/users'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(body));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['token'];
    } else {
      return null;
    }
  }

  Future<bool> editUser(UserRequest userRequest) async {
    final body = {'name': userRequest.name, 'phone': userRequest.phone};
    final response = await http.put(
        Uri.parse(host + '/api/v1/users/' + userRequest.id),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body));
    if (response.statusCode == 200) {
      // Map<String, dynamic> data = json.decode(response.body);
      return true;
    } else {
      return false;
    }
  }
}
