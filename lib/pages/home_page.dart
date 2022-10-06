import 'package:flutter/material.dart';
import 'package:habit_tracker_v2/component/habit_tile.dart';
import 'package:habit_tracker_v2/component/my_fab.dart';
import 'package:habit_tracker_v2/component/new_habit_dialogBox.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _newHabitcontrollar = TextEditingController();
  List todaysHabitList = [
    ["Morning Walk", false],
    ["Read Book", false],
    ["Code", false]
  ];
//HAbitTile checkBox
  void checkBoxTaped(bool? value, int index) {
    setState(() {
      todaysHabitList[index][1] = value;
    });
  }

//NewHabit Box functions
  void newHabitSave() {
    setState(() {
      todaysHabitList.add([_newHabitcontrollar.text, false]);
    });
    Navigator.of(context).pop();
    _newHabitcontrollar.clear();
  }

  //on new habit cancle
  void cancleNewHabit() {
    Navigator.of(context).pop();
    _newHabitcontrollar.clear();
  }

//Create new habit
  void createHabit() {
    setState(() {
      showDialog(
          context: context,
          builder: (context) {
            return NewHabitBox(
                onSave: newHabitSave,
                controller: _newHabitcontrollar,
                onCancle: cancleNewHabit);
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: MyFloatingActionButton(onPressed: createHabit),
        backgroundColor: Colors.grey[300],
        body: ListView.builder(
          itemCount: todaysHabitList.length,
          itemBuilder: (context, index) {
            return HabitTile(
                habitName: todaysHabitList[index][0],
                habitCompleted: todaysHabitList[index][1],
                onchanged: (value) => checkBoxTaped(value, index));
          },
        ),
      ),
    );
  }
}
