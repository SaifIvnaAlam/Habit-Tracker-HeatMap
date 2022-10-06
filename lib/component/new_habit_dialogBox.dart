import 'package:flutter/material.dart';

class NewHabitBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancle;

  final String hitText;
  const NewHabitBox(
      {Key? key,
      required this.onCancle,
      required this.controller,
      required this.onSave,
      required this.hitText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hitText,
            hintStyle: const TextStyle(color: Colors.white),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          )),
      actions: [
        MaterialButton(
          color: Colors.black,
          onPressed: onSave,
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          color: Colors.black,
          onPressed: onCancle,
          child: const Text(
            'Cancle',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
