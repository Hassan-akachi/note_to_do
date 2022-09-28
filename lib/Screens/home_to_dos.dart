import 'package:flutter/material.dart';
import 'package:note_to_do/Screens/note/notes_screen.dart';
import 'package:note_to_do/Screens/to_do_list_screens/to_do_list_screen.dart';
import 'package:note_to_do/Widgets/pop_menu.dart';

import '../Util/deleteAll.dart';
import '../Widgets/MySearchWidget.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = "Home-TO-DO-Screen";

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  late TabController controller;


  @override
  void initState() {
  super.initState();
  controller =TabController(length: 2, vsync: this);
      controller.addListener(() { setState((){});});
  }


  @override
  Widget build(BuildContext context) {
    int tabNum = controller.index;
    return Scaffold(
        appBar: AppBar(
          title: const Text('TASK/ To-Do'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: MySearchDelegate(tabNum));
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  deleteAll(context,tabNum);
                },
                icon: const Icon(Icons.delete)),
           const PopMenu(),
          ],
          bottom:  TabBar(
            controller: controller,
              labelPadding: const EdgeInsets.symmetric(horizontal: 70),
              isScrollable: true,
              tabs: const [
                Tab(
                  text: "To-Do",
                ),
                Tab(
                  text: "Notes",
                )
              ]),
        ),
        body:  TabBarView(controller: controller,
            children: const [ToDOListScreen(), NoteScreen()]));
  }

  @override
  void dispose() {
    controller.dispose();
  super.dispose();

  }
}

