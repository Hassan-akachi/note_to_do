import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:note_to_do/Models/to_do_list.dart';
import 'package:note_to_do/Providers/to_do_list_provider.dart';
import 'package:note_to_do/Widgets/to_do/addToDo.dart';
import 'package:note_to_do/Widgets/to_do/add_to_do_list.dart';
import 'package:provider/provider.dart';

import '../../Providers/to_do_provider.dart';
import '../../constants/styles.dart';

class AddToDoListScreen extends StatelessWidget {
  static const routeName = "Add-TO-DO-Screen";
  final ToDoList? toDoLists;

  const AddToDoListScreen({super.key, this.toDoLists});

  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    title.text = toDoLists?.title ?? "";
    DateTime now = toDoLists?.createdListAt ?? DateTime.now();
    var formatter = DateFormat("yyy-MM-dd");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NotePad",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {
                Provider.of<ToDoListProvider>(context, listen: false).addTask(title.text,toDoLists?.addtodo,now
                );
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
            child: Text(
              "Total Todos- ${Provider.of<ToDoListProvider>(context).todolist.map((e) => e.addtodo.length)}",
              style: const TextStyle(fontSize: 20),
            ),
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
                      now =date;
                  }
                , currentTime: DateTime.now(), locale: LocaleType.en);
              }, //language},
              child: Text(
                "${formatter.format(now)}   ${DateFormat('EEE,hh:mm a').format(now)}",
                style: const TextStyle(fontSize: 20),
              )),
          const SizedBox(
            height: 20,
          ),
           Expanded(flex: 2, child:  const AddToDoList() ),
          const Align(alignment: Alignment.bottomCenter, child: AddToDo())
        ],
      ),
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       showModalBottomSheet(
      //           context: context,
      //           builder: (context) {
      //             return const AddToDo();
      //           });
      //     },
      //     child: const Icon(Icons.add),
      //   ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
