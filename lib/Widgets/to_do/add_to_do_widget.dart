import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_to_do/Models/to_do.dart';

class ToDoWidget extends StatelessWidget {
  final ToDo toDo;
  final void Function(bool?) toggleCheck;

  const ToDoWidget(
      {key,
      required this.toggleCheck,
      required this.toDo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController toDoController = TextEditingController();
    toDoController.text = toDo.name ?? "";
    return ListTile(
        leading: Checkbox(
          value: toDo.isChecked,
          shape: const CircleBorder(side: BorderSide.none),
          onChanged: toggleCheck,
        ),
        title: toDo.isChecked
            ? Text(
                toDo.name,
                style: const TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough),
              )
            : TextField(
                controller: toDoController,
                decoration: const InputDecoration(border: InputBorder.none),
              ),);
  }
}
