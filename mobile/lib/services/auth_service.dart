import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile/constant.dart';
import 'package:mobile/payload/request/auth_request.dart';
import 'package:mobile/utils/SharedPrefsUtil.dart';
import 'package:mobile/payload/response/user_reponse.dart';

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

  Future<UserResponse?> getUser() async {
    Future<String?> tokenFuture = SharedPrefsUtil.getToken();
    String? token = await tokenFuture;
    token ??= '';
    print(token + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    final headers = {
      'Content-Type': 'application/json',
      'x-access-token': token,
    };
    if (token != '') {
      final response =
          await http.get(Uri.parse(host + '/api/v1/auth'), headers: headers);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final user = UserResponse.fromJson(jsonData);
        return user;
      } else {
        throw Exception('Get profile user no success');
      }
    } else {
      return null;
    }
  }
}
