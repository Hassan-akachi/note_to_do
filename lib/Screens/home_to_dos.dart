import 'package:flutter/material.dart';
import 'package:note_to_do/Screens/note/notes_screen.dart';
import 'package:note_to_do/Screens/to_do_list_screens/to_do_list_screen.dart';

import '../Widgets/MySearchWidget.dart';

class MyHomePage extends StatelessWidget {
  static const routeName = "Home-TO-DO-Screen";

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('TASK/ To-Do'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: MySearchDelegate());
                  },
                  icon: const Icon(Icons.search))
            ],
            bottom: const TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 70),
                isScrollable: true,
                tabs: [
                  Tab(
                    text: "To-Do",
                  ),
                  Tab(
                    text: "Notes",
                  )
                ]),
          ),
          body: const TabBarView(children: [ToDOListScreen(), NoteScreen()])),
    );
  }
}

