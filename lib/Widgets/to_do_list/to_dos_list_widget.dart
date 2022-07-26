import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_to_do/Models/to_do.dart';
import 'package:note_to_do/Models/to_do_list.dart';
import 'package:note_to_do/Screens/add_to_do_screens/add_to_do_list_screen.dart';
import 'package:note_to_do/constants/colors.dart';

class ToDosListWidget extends StatelessWidget {
  final ToDoList toDoLists;

  const ToDosListWidget({Key? key, required this.toDoLists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? tabColor() {
      final random = Random();
      var raColor = noteTabColors[random.nextInt(noteTabColors.length)];//random generator
      return raColor;
    }

    return Card(
      color: tabColor(),
      child: ListTile(
        title: Text(toDoLists.title),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  AddToDoListScreen(toDoLists: toDoLists,)));
        },
        trailing: Text(
          DateFormat('EEE,hh:mm a').format(toDoLists.createdListAt),
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ))
    );
  }
}