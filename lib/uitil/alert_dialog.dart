import 'package:flutter/material.dart';
import 'package:to_do_app/uitil/button.dart';

class MyAlertDialog extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  MyAlertDialog({Key? key, required this.controller,required this.onSave,required this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: Colors.yellow.shade400,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder()),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Cancel", onPressed: onCancel),
                SizedBox(width: 8,),
                MyButton(text: "Save", onPressed: onSave),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
