import 'package:flutter/material.dart';
import 'package:note_to_do/Providers/to_do_list_provider.dart';
import 'package:provider/provider.dart';


class AddToDo extends StatelessWidget {
  static const routeName = "Add-TO-DO-Screen";

  const AddToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController inputTextController = TextEditingController();

    return Container(
        width: MediaQuery.of(context).size.width,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListTile(
          title: TextField(
            controller: inputTextController,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: 'Enter to-do'),
            onSubmitted: (value) {
              inputTextController.text = value;
              Provider.of<ToDoListProvider>(context, listen: false)
                  .addTodo(inputTextController.text);
              inputTextController.clear();
            },
            autofocus: true,
          ),
          trailing: IconButton(
            onPressed: () {
              Provider.of<ToDoListProvider>(context, listen: false)
                  .addTodo(inputTextController.text);
              inputTextController.clear();
             FocusManager.instance.primaryFocus?.unfocus(); //dismiss keyboard
            },
            icon: const Icon(Icons.send),
          ),
        ));
  }
}
