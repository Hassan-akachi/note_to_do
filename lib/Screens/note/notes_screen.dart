import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/notes_provider.dart';
import '../../Widgets/notes/note_list.dart';
import 'note_pad.dart';

class NoteScreen extends StatelessWidget {
  static const routeName = "Note-Screen";

  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: const NoteList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<NoteProvider>(context, listen: false).noteIndex =
               Provider.of<NoteProvider>(context, listen: false).notes.length;
          Navigator.pushNamed(context, NotePad.routeName);
        },
        child: const Icon(Icons.edit),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
