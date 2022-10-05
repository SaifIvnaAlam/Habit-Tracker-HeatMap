import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onchanged;
  const HabitTile({
    Key? key,
    required this.habitName,
    required this.habitCompleted,
    required this.onchanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Checkbox(value: habitCompleted, onChanged: onchanged),
            Text(habitName),
          ],
        ),
      ),
    );
  }
}
