import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile/constant.dart';
import 'package:mobile/utils/SharedPrefsUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    // final String apiUrl = "http://localhost:9999/api/v1/auth/login";
    // print("hello");
    final body = {
      'email': _emailController.text.trim(),
      'password': _passwordController.text.trim(),
    };
    final response = await http.post(Uri.parse(host + '/api/v1/auth/login'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(body));
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      SharedPrefsUtil.saveToken(data['token']);
      // Nếu đăng nhập thành công, hiển thị thông báo tost
      // Fluttertoast.showToast(
      //   msg: "Đăng nhập thành công!",
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.BOTTOM,
      //   timeInSecForIosWeb: 5,
      //   backgroundColor: Colors.green,
      //   textColor: Colors.white,
      //   fontSize: 16.0,
      // Đặt offset để hiển thị Toast bên trên bên dưới một tí
      // Tính từ tâm của Toast
      // Giá trị offset theo chiều dọc là số âm, càng nhỏ thì Toast càng lên cao
      // Giá trị offset theo chiều ngang là số dương hoặc số âm đều được
      // Ví dụ: offset: Offset(0.0, -50.0) sẽ đặt Toast bên trên bên dưới màn hình, cách mép dưới màn hình 50 điểm ảnh
      // );
      // Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(
        context,
        '/home',
      );
      // Hành động cần thực hiện sau khi hàm dừng trong 2 giây
      //});
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                //Hello again!
                SvgPicture.asset(
                  'assets/images/iconweb.svg',
                  semanticsLabel: 'An SVG image',
                  height: 70,
                ),
                //Hello again!
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Sofe Social - Mạng xã hội trực tuyến an toàn',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 50),

                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nhập tên email',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nhập mật khẩu',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        await _login();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      child: Text(
                        "Đăng nhập ",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        print(_emailController);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 33, 243, 103)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      child: Text(
                        "Đăng ký ",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bạn quên mật khẩu?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150,
                ),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Develop by ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Dia&Nhan&Tien',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
