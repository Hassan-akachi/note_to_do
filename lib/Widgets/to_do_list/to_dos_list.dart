import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_to_do/Providers/to_do_list_provider.dart';
import 'package:note_to_do/Widgets/to_do_list/to_dos_list_widget.dart';
import 'package:provider/provider.dart';

class ToDosList extends StatelessWidget {
  const ToDosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoListProvider>(builder: (BuildContext context, state, Widget? child) {

      return Align(
        alignment: Alignment.topCenter,
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            reverse: true,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final todolistItem =state.todolist[index];

              return Dismissible(
                  key: Key(todolistItem.title),
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
                  child: ToDosListWidget(toDoLists: todolistItem));
            },
            itemCount: state.todolist.length,
          ),
        ),
      );
    });
  }
}