import 'package:flutter/material.dart';

class NewHabitBox extends StatelessWidget {
  const NewHabitBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: const TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          )),
      actions: [
        MaterialButton(
          color: Colors.black,
          onPressed: () {},
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          color: Colors.black,
          onPressed: () {},
          child: const Text(
            'Cancle',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
