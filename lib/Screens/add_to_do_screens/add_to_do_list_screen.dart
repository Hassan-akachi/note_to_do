import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:note_to_do/Models/to_do_list.dart';
import 'package:note_to_do/Providers/to_do_list_provider.dart';
import 'package:note_to_do/Widgets/to_do/addToDo.dart';
import 'package:note_to_do/Widgets/to_do/add_to_do_list.dart';
import 'package:provider/provider.dart';

import '../../Res/styles.dart';

class AddToDoListScreen extends StatefulWidget {
  static const routeName = "Add-TO-DO-Screen";
  final ToDoList? toDoLists;

  const AddToDoListScreen({super.key, this.toDoLists});

  @override
  State<AddToDoListScreen> createState() => _AddToDoListScreenState();
}

class _AddToDoListScreenState extends State<AddToDoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoListProvider>(
        builder: (BuildContext context, state, Widget? child) {
      final taskid=state.todolist[state.taskIndex].id;
      final TextEditingController title = TextEditingController();
      title.text = widget.toDoLists?.title ?? "";
      DateTime now = widget.toDoLists?.createdListAt ?? state.setTimer;
      var formatter = DateFormat("yyy-MM-dd");
      return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.toDoLists == null ? "Create Todo" : "Edit Todo",
            style: const TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            IconButton(
                onPressed: () {
                  state.addTask(
                      title.text,
                      state.todolist[state.taskIndex].addtodo,
                      now,
                      state.taskIndex,
                      widget.toDoLists?.isSwitched ??state.todolist[taskid].isSwitched);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Todos- ${widget.toDoLists ==null ? state.todolist[state.taskIndex].addtodo.length : 0}",
                //Provider.of<ToDoListProvider>(context).todolist.map((e) => e.addtodo.length)
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  flex: 0,
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    decoration: kEditTextDecoration.copyWith(
                      hintText: "TITLE",
                      labelText: "Title",
                    ),
                    controller: title,
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        setState((){
                        state.setTime(now, context);});
                      },
                      child: Text(
                        "${formatter.format(now)}   ${DateFormat('EEE,hh:mm a').format(now)}",
                        style: const TextStyle(fontSize: 20),
                      )),
                  Switch(
                      value: widget.toDoLists?.isSwitched ?? state.isSwitched,
                      onChanged: (isSet) {
                           state.updateSwitch(widget.toDoLists);
                      })
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            widget.toDoLists ==null?
              const Expanded(flex: 2, child: AddToDoList()) :
              const Expanded(child: Center(child: Text('Empty'))),
              const Align(alignment: Alignment.bottomCenter, child: AddToDo())
            ],
          ),
        ),
      );
    });
  }
}
