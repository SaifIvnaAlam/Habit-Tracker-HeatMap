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
      backgroundColor: Color(0xffFFFFFF),
      content: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hitText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff222222)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff222222)),
            ),
          )),
      actions: [
        MaterialButton(
          color: Color(0xff84DCC6),
          onPressed: onSave,
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          color: Color(0xff4B4E6D),
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
