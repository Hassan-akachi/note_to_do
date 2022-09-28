import 'package:flutter/material.dart';
import 'package:note_to_do/Widgets/to_do_list/to_dos_list.dart';
import 'package:provider/provider.dart';

import '../../Providers/to_do_list_provider.dart';
import '../add_to_do_screens/add_to_do_list_screen.dart';

class ToDOListScreen extends StatelessWidget {
  static const routeName = "TO-DO-Screen";

  const ToDOListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       body:
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Text(
              "Total Todos- ${Provider.of<ToDoListProvider>(context).todolist.length}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(flex:2,
                child:ToDosList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
           Provider.of<ToDoListProvider>(context,listen: false).increaseTodolist();
            Navigator.pushNamed(context,AddToDoListScreen.routeName );
            },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
