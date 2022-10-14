import 'package:flutter/material.dart';
import 'package:note_to_do/Providers/to_do_list_provider.dart';
import 'package:note_to_do/Widgets/to_do/add_to_do_widget.dart';
import 'package:provider/provider.dart';


class AddToDoList extends StatelessWidget {

  const AddToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoListProvider>(builder: (BuildContext context, state, Widget? child) {
      return Scrollbar(
        child: Align(alignment: Alignment.topRight,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            reverse: true,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final todo =state.todolist[state.taskIndex].addtodo[index];
              //state.todolist.map((e) => e.addtodo[index]).toList();

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
                  state.deleteTodo(todo);
                },
                key: UniqueKey(),
                child: ToDoWidget(
                  toggleCheck:(value)=> state.updateTodo(todo),
                  toDo: todo,
                ),
              );
            },
            itemCount: state.todolist[state.taskIndex].addtodo.length,
          ),
        ),
      );
    });
  }
}
