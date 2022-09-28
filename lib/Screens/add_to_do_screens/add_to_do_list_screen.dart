import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:note_to_do/Models/to_do_list.dart';
import 'package:note_to_do/Providers/to_do_list_provider.dart';
import 'package:note_to_do/Widgets/to_do/addToDo.dart';
import 'package:note_to_do/Widgets/to_do/add_to_do_list.dart';
import 'package:provider/provider.dart';

import '../../constants/styles.dart';

class AddToDoListScreen extends StatelessWidget {
  static const routeName = "Add-TO-DO-Screen";
  final ToDoList? toDoLists;

  const AddToDoListScreen({super.key, this.toDoLists});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoListProvider>(
        builder: (BuildContext context, state, Widget? child) {
      final TextEditingController title = TextEditingController();
      title.text = toDoLists?.title ?? "";
      DateTime now = toDoLists?.createdListAt ?? DateTime.now();
      var formatter = DateFormat("yyy-MM-dd");
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "TODO",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            IconButton(
                onPressed: () {
                  state.addTask(
                      title.text,
                      state.todolist[state.taskIndex].addtodo,
                      now,
                      state.taskIndex);
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
                "Total Todos- ${state.todolist[state.taskIndex].addtodo.length ?? 0}",
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
              InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true, minTime: DateTime.now(),
                        // maxTime: DateTime(2023, 6, 7),
                        onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      // if (inputTextController.text.isNotEmpty) {
                      //   Provider.of<ToDoProvider>(context, listen: false)
                      //       .addTask(inputTextController.text, date);
                      now = date;
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  }, //language},
                  child: Text(
                    "${formatter.format(now)}   ${DateFormat('EEE,hh:mm a').format(now)}",
                    style: const TextStyle(fontSize: 20),
                  )),
              const SizedBox(
                height: 20,
              ),
              const Expanded(flex: 2, child: AddToDoList()),
              const Align(alignment: Alignment.bottomCenter, child: AddToDo())
            ],
          ),
        ),
      );
    });
  }
}
