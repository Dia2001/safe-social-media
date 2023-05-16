import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:html' as html;
import 'package:mobile/payload/request/post_request.dart';
import 'package:mobile/services/post_service.dart';
import 'package:mobile/views/components/need_to_login.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/utils/SharedPrefsUtil.dart';
import 'package:mobile/payload/response/user_reponse.dart';

class UploadImageForm extends StatefulWidget {
  @override
  _UploadImageFormState createState() => _UploadImageFormState();
}

class _UploadImageFormState extends State<UploadImageForm> {
  final PostService _postService = PostService();
  String _inputText = '';
  List<int>? _selectedFile;
  Uint8List? _bytesData;
  UserResponse? _user;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  Future<void> checkToken() async {
    if (await SharedPrefsUtil.hasToken()) {
      UserResponse? user = await _authService.getUser();
      if (user != null) {
        setState(() {
          _user = user;
        });
      }
    }
  }

  startWebFilePicker() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen((event) {
        setState(() {
          _bytesData =
              Base64Decoder().convert(reader.result.toString().split(",").last);
          _selectedFile = _bytesData;
        });
      });
      reader.readAsDataUrl(file);
    });
  }

  Future<void> uploadImage(BuildContext context) async {
    PostRequest postRequest = PostRequest(_selectedFile, _inputText);
    bool uploadCheck = await _postService.uploadPost(postRequest);
    if (uploadCheck) {
      Navigator.pushReplacementNamed(
        context,
        '/home',
      );
    } else {
      print("upload post not success");
    }
  }

  @override
  Widget build(BuildContext context) {
    return _user == null
        ? NotLoggedInScreen()
        : SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _bytesData != null
                      ? Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Stack(
                            children: [
                              Container(
                                width: 400,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.memory(
                                    _bytesData!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        _bytesData = null;
                                      });
                                    },
                                    backgroundColor: Colors.red,
                                    child: Icon(Icons.close),
                                  )),
                            ],
                          ),
                        )
                      : GestureDetector(
                          onTap: () => startWebFilePicker(),
                          child: Container(
                            margin: const EdgeInsets.only(top: 32, bottom: 28),
                            height: 277,
                            width: 300,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(217, 217, 217, 1),
                                width: 2.0,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 120,
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                ),
                                SizedBox(height: 16.0),
                                Text(
                                  "Tải ảnh lên",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                  Container(
                    width: 400,
                    margin: const EdgeInsets.only(top: 16, bottom: 18),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _inputText = value;
                        });
                      },
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'Bạn đang nghĩ gì ...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 60,
                    margin: const EdgeInsets.only(top: 16, bottom: 16),
                    child: ElevatedButton(
                      onPressed: () => uploadImage(context),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green[400]),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: const Text(
                        "Đăng bài viết",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
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
