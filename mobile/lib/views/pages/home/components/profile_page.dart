import 'package:flutter/material.dart';
import 'package:mobile/payload/response/user_reponse.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/utils/SharedPrefsUtil.dart';
import 'package:mobile/views/components/need_to_login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  UserResponse? _user;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    ifUser();
  }

  Future<void> ifUser() async {
    if (await SharedPrefsUtil.hasToken()) {
      UserResponse? user = await _authService.getUser();
      if (user != null) {
        setState(() {
          _email.text = user.email;
          _name.text = user.name;
          _phone.text = user.phone;
          _user = user;
        });
      }
    }
  }

  logout() async {
    try {
      await SharedPrefsUtil.clearToken();
      Navigator.pushReplacementNamed(
        context,
        '/home',
      );
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _user == null
          ? NotLoggedInScreen()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 18.0, bottom: 18),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image(
                          image: NetworkImage(_user!.avatar),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 18, bottom: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Tên"),
                                SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller: _name,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Tên thật',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 18, bottom: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Tên tài khoản"),
                                SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller: _email,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Tên tài khoản',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 18, bottom: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Số điện thoại"),
                                SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller: _phone,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Số điện thoại',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 60,
                    margin: const EdgeInsets.only(top: 16, bottom: 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[800]),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: const Text(
                        "Cập nhật",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 60,
                    margin: const EdgeInsets.only(top: 16, bottom: 16),
                    child: ElevatedButton(
                      onPressed: () => logout(),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red[800]),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: const Text(
                        "Đăng xuất",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
