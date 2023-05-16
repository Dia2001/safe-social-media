import 'package:mobile/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile/constant.dart';
import 'package:mobile/payload/request/auth_request.dart';

class AuthService {
  Future<String?> login(AuthRequest authRequest) async {
    final body = {
      'email': authRequest.email,
      'password': authRequest.password,
    };
    final response = await http.post(Uri.parse(host + '/api/v1/auth/login'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(body));
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['token'];
    } else {
      throw Exception('Failed to login');
    }
  }
}
