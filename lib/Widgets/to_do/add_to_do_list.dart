import 'package:flutter/material.dart';
import 'package:note_to_do/Providers/to_do_list_provider.dart';
import 'package:note_to_do/Widgets/to_do/add_to_do_widget.dart';
import 'package:provider/provider.dart';

import '../../Providers/to_do_provider.dart';

class AddToDoList extends StatelessWidget {

  const AddToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoListProvider>(builder: (BuildContext context, state, Widget? child) {
      return Scrollbar(
        thumbVisibility: true,
        child: Align(alignment: Alignment.topCenter,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            reverse: true,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final todo =state.todolist.map((e) => e.addtodo[index]).toList();

              return Dismissible(
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
                  state.deleteTodo(todo[index]);
                },
                key: Key(todo[index].name),
                child: ToDoWidget(
                  toggleCheck:(value)=> state.updateTodo(todo[index]),
                  toDo: todo[index],
                ),
              );
            },
            itemCount: state.todolist.map((e) => e.addtodo).toList().length,
          ),
        ),
      );
    });
  }
}
