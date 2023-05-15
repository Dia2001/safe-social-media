import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UploadImageForm extends StatefulWidget {
  @override
  _UploadImageFormState createState() => _UploadImageFormState();
}

class _UploadImageFormState extends State<UploadImageForm> {
  String _inputText = '';
  Uint8List? _imageBytes;
  bool _isImageSelected = false;

  Future<void> _selectImage() async {
    final mediaData = await ImagePickerWeb.getImageInfo;

    if (mediaData != null) {
      final bytes = mediaData.data;
      if (bytes != null) {
        final imageUrl = base64Encode(bytes);
        setState(() {
          _imageBytes = bytes;
          _isImageSelected = true;
        });
      } else {
        // Handle the case when bytes is null
        print('Error: Image data is null');
      }
    }
  }

  // Future<void> pickAndUploadData() async {
  //   final pickedFile = await ImagePickerWeb.getImageAsFile();

  //   if (pickedFile != null) {
  //     final bytes =  pickedFile.readAsBytesSync();
  //     final base64Image = base64Encode(bytes);

  //     final url = 'URL_API_CỦA_BẠN';
  //     final request = http.MultipartRequest('POST', Uri.parse(url));
  //     request.fields['paragraph'] = 'NỘI_DUNG_VĂN_BẢN';

  //     request.files.add(
  //         http.MultipartFile.fromBytes('image', bytes, filename: 'image.jpg'));

  //     final response = await request.send();
  //     if (response.statusCode == 200) {
  //       print('Dữ liệu đã được gửi thành công!');
  //     } else {
  //       print('Lỗi khi gửi dữ liệu: ${response.statusCode}');
  //     }
  //   }
  // }

  //  Future<void> _uploadImage() async {
  //   try {
  //     final url = 'YOUR_API_ENDPOINT'; // Thay YOUR_API_ENDPOINT bằng đường dẫn API của bạn

  //     final multipartFile = http.MultipartFile.fromBytes(
  //       'image',
  //       _imageBytes!,
  //       filename: 'image.jpg',
  //       contentType: MediaType('image', 'jpeg'),
  //     );

  //     final request = http.MultipartRequest('POST', Uri.parse(url));
  //     request.files.add(multipartFile);

  //     final response = await request.send();

  //     if (response.statusCode == 200) {
  //       print('Thêm ảnh thành công');
  //     } else {
  //       print('Thêm ảnh không thành công. Mã lỗi: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Đã xảy ra lỗi khi gọi API: $error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_imageBytes != null)
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
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
                      _imageBytes!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            if (!_isImageSelected)
              GestureDetector(
                onTap: () => _selectImage(),
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
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.green[400]),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
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
