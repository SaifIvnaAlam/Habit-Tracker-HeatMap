import 'package:flutter/material.dart';
import 'package:habit_tracker_v2/component/habit_tile.dart';
import 'package:habit_tracker_v2/component/month_summary.dart';
import 'package:habit_tracker_v2/component/my_fab.dart';
import 'package:habit_tracker_v2/component/new_habit_dialogBox.dart';
import 'package:habit_tracker_v2/data/habit_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _newHabitcontrollar = TextEditingController();
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");
  //initialsate
  @override
  void initState() {
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    } else {
      db.loadData();
    }
    db.updateDatabase();
    super.initState();
  }

//HAbitTile checkBox
  void checkBoxTaped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
    db.updateDatabase();
  }

//NewHabit Box functions
  void newHabitSave() {
    setState(() {
      db.todaysHabitList.add([_newHabitcontrollar.text, false]);
    });
    Navigator.of(context).pop();
    _newHabitcontrollar.clear();
    db.updateDatabase();
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
                hitText: "Enter Habit Name",
                onSave: newHabitSave,
                controller: _newHabitcontrollar,
                onCancle: cancleNewHabit);
          });
    });
    db.updateDatabase();
  }

//setting button
  void openHabitSettings(int index) {
    String habitRename = db.todaysHabitList[index][0];
    showDialog(
        context: context,
        builder: (context) {
          return NewHabitBox(
              hitText: "Rename $habitRename",
              onCancle: cancleNewHabit,
              controller: _newHabitcontrollar,
              onSave: () => saveExistingHabit(index));
        });
  }

//Setting: save existingHabit
  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitcontrollar.text;
    });
    Navigator.of(context).pop();
    _newHabitcontrollar.clear();
    db.updateDatabase();
  }

// Setting: delete habit
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: MyFloatingActionButton(onPressed: createHabit),
        backgroundColor: Colors.grey[300],
        body: ListView(children: [
          MonthlySummary(
            datasets: db.heatMapDataSet,
            startDate: _myBox.get("START_DATE"),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: db.todaysHabitList.length,
            itemBuilder: (context, index) {
              return HabitTile(
                habitName: db.todaysHabitList[index][0],
                habitCompleted: db.todaysHabitList[index][1],
                onchanged: (value) => checkBoxTaped(value, index),
                settingTapped: (context) => openHabitSettings(index),
                deleteTapped: (contex) => deleteHabit(index),
              );
            },
          ),
        ]),
      ),
    );
  }
}
