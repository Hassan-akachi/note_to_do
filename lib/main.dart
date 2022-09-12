import 'package:flutter/material.dart';
import 'package:note_to_do/Providers/to_do_list_provider.dart';
import 'package:note_to_do/Screens/add_to_do_screens/add_to_do_list_screen.dart';
import 'package:note_to_do/Screens/note/note_pad.dart';
import 'package:provider/provider.dart';

import 'Providers/notes_provider.dart';
import 'Screens/home_to_dos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NoteProvider()),
        ChangeNotifierProvider(create: (context) => ToDoListProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
        routes: {
          MyHomePage.routeName: (context) => const MyHomePage(),
          NotePad.routeName: (context) => const NotePad(),
          AddToDoListScreen.routeName :(context) => const AddToDoListScreen()
        },
      ),
    );
  }
}
