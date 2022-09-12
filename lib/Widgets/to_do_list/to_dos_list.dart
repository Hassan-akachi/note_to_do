import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_to_do/Providers/to_do_list_provider.dart';
import 'package:provider/provider.dart';

import '../../Screens/add_to_do_screens/add_to_do_list_screen.dart';
import '../../constants/colors.dart';

class ToDosList extends StatelessWidget {
  const ToDosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? tabColor() {
      final random = Random();
      var raColor = noteTabColors[
          random.nextInt(noteTabColors.length)]; //random generator
      return raColor;
    }

    return Consumer<ToDoListProvider>(
        builder: (BuildContext context, state, Widget? child) {
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            controller: ScrollController(),
            reverse: true,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final todolistItem = state.todolist[index];

              return Dismissible(
                  key: UniqueKey(),
                  background: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('This task was deleted',
                          style: TextStyle(
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  onDismissed: (direction) {
                    state.deleteTask(todolistItem);
                  },
                  child: Card(
                      color: tabColor(),
                      child: ListTile(
                          title: Text(todolistItem.title),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddToDoListScreen(
                                        toDoLists: todolistItem)));
                            state.taskIndex = index;
                            todolistItem.id =state.taskIndex;
                            print("${state.taskIndex } ,list num id ${todolistItem.id}");
                          },
                          trailing: Text(
                            DateFormat('EEE,hh:mm a')
                                .format(todolistItem.createdListAt),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ))));
            },
            itemCount: state.todolist.length,
          ),
        ),
      );
    });
  }
}
