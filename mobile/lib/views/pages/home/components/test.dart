import 'dart:typed_data';
import 'dart:html' as html;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class ImageUploadScreen extends StatefulWidget {
  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  List<int>? _selectedFile;
  Uint8List? _bytesData;

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

  Future uploadImage() async {
    var url = Uri.parse("http://localhost:3080/post-article");
    var request = http.MultipartRequest("POST", url);
    request.headers['x-access-token'] =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjdXJyZW50VXNlciI6eyJpZCI6IjY0NjBlNjdmOTk2NDgxMDZmNDA1MWY2YSJ9LCJpYXQiOjE2ODQxNTg3MjcsImV4cCI6MTY4NDUxODcyN30.WtFHJAFIfWJFpVNlwC-PpkslYc04FaLSMrAvRPa97yA';
    request.fields['paragraph'] = 'hello mình là hương đây';
    request.files.add(await http.MultipartFile.fromBytes(
        'image', _selectedFile!,
        contentType: MediaType('application', 'json'),
        filename: "Any_name.jpg"));

    request.send().then((response) {
      if (response.statusCode == 201) {
        print("File uploaded successfully");
      } else {
        print('file upload failed');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          children: [
            Text('Let\'s upload Image'),
            SizedBox(height: 20),
            MaterialButton(
              color: Colors.pink,
              elevation: 8,
              highlightElevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textColor: Colors.white,
              child: Text("Select Photo"),
              onPressed: () {
                startWebFilePicker();
              },
            ),
            Divider(
              color: Colors.teal,
            ),
            _bytesData != null
                ? Image.memory(_bytesData!, width: 200, height: 200)
                : Container(),
            MaterialButton(
              color: Colors.purple,
              elevation: 8,
              highlightElevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textColor: Colors.white,
              child: Text("Send file to server"),
              onPressed: () {
                uploadImage();
              },
            ),
          ],
        )),
      ),
    );
  }
}
