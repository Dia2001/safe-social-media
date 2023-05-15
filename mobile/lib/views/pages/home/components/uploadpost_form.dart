import 'package:flutter/material.dart';
import 'package:mobile/views/components/bottom_navigate_bar.dart';

class UpPost extends StatefulWidget {
  const UpPost({Key? key}) : super(key: key);

  @override
  State<UpPost> createState() => _UpPostState();
}

class _UpPostState extends State<UpPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Material(
            elevation: 0.0,
            shape: const CircleBorder(),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              color: Colors.black,
              onPressed: () {
                // Go back to the previous page.
                Navigator.pop(context);
              },
            ),
          )),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                print("To upload image");
              },
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
                          color: Color.fromRGBO(217, 217, 217, 1)),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 16, bottom: 18),
              child: TextField(
                  onChanged: ((value) {}),
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Bạn đang nghĩ gì ...',
                    border: OutlineInputBorder(),
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
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarHome(),
    );
  }
}
