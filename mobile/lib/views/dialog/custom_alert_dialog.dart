import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String text;

  const CustomAlertDialog({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        shadowColor: Colors.red,
        title: Text(
          title,
          style: const TextStyle(color: Colors.red),
        ),
        titlePadding: const EdgeInsets.all(20),
        contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        backgroundColor: const Color.fromARGB(120, 0, 0, 0),
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Text(text, style: const TextStyle(color: Colors.white))),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SimpleDialogOption(
                  child: const Text(
                    "Cancer",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          )
        ]);
  }
}
