import 'package:flutter/material.dart';
import 'package:note_to_do/Models/to_do.dart';

class ToDoWidget extends StatefulWidget {
  final ToDo? toDo;
  final void Function(bool?) toggleCheck;

  const ToDoWidget(
      {key,
      required this.toggleCheck,
      required this.toDo})
      : super(key: key);

  @override
  State<ToDoWidget> createState() => _ToDoWidgetState();
}

class _ToDoWidgetState extends State<ToDoWidget> {
  TextEditingController toDoController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    toDoController.text = widget.toDo?.name ?? "";
    return ListTile(
        leading: Checkbox(
          value: widget.toDo?.isChecked ?? false ,
          shape: const CircleBorder(side: BorderSide.none),
          onChanged: widget.toggleCheck,
        ),
        title: widget.toDo?.isChecked == true
            ? Text(
                widget.toDo!.name,
                style: const TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough),
              )
            : TextField(
                controller: toDoController,
                decoration: const InputDecoration(border: InputBorder.none),
              ),);
  }

  @override
  void dispose() {
    toDoController.dispose();
    super.dispose();
  }
}
