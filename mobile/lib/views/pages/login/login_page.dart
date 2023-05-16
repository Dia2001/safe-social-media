import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/utils/SharedPrefsUtil.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/payload/request/auth_request.dart';
import 'package:mobile/views/dialog/custom_alert_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  Future<void> _login() async {
    AuthRequest authRequest = AuthRequest(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
    String? token = await _authService.login(authRequest);
    if (token != null) {
      SharedPrefsUtil.saveToken(token);
      Navigator.pushReplacementNamed(
        context,
        '/home',
      );
    } else {
      showLoginDialog(context, 'Đăng nhập thất bại',
          'Vui lòng kiểm tra tài khoản hoặc mật khẩu');
      // throw Exception('Failed to login');
    }
  }

  registerPage(BuildContext context) async {
    Navigator.pushReplacementNamed(
      context,
      '/register',
    );
  }

  void showLoginDialog(BuildContext context, String title, String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            CustomAlertDialog(title: title, text: text));
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
                      onPressed: () => registerPage(context),
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
