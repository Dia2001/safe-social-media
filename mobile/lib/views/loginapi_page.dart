import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage1 extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<Map<String, dynamic>> _login() async {
    final String apiUrl = "http://localhost:9999/api/v1/auth/login";
    print("hello");
    final body = {
      'email': _emailController.text.trim(),
      'password': _passwordController.text.trim(),
    };
    final response = await http.post(Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'}, body: json.encode(body));
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> user = json.decode(response.body);
      return user;
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> user = await _login();
                print(_emailController.text);
                print(user['token']);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
