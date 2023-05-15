import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile2 extends StatefulWidget {
  const Profile2({Key? key}) : super(key: key);

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController(text: "Nguyễn Hữu Nhân");
    TextEditingController email = TextEditingController();
    email.text = "nguyenhuunhan@gmail.com";
    TextEditingController sdt = TextEditingController();
    sdt.text = "0985255602";
    return Scaffold(
        appBar: AppBar(title: const Text("Demo")),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 69.0, bottom: 69),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: const Image(
                    image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    width: 139,
                    height: 139,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: FractionallySizedBox(
                    widthFactor: 0.6,
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
                                  controller: name,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Tên thật',
                                  ),
                                ),
                              )
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
                                  controller: email,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Tên tài khoản',
                                  ),
                                ),
                              )
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
                                  controller: sdt,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Số điện thoại',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              Container(
                width: 261,
                height: 80,
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                //padding: const EdgeInsets.only(top: 12,right:18,bottom:12,left:18),
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
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    "Cập nhật",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 261,
                height: 80,
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                //padding: const EdgeInsets.only(top: 12,right:18,bottom:12,left:18),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[800]),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      "Đăng xuất",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    )),
              )
            ],
          ),
        ));
  }
}
