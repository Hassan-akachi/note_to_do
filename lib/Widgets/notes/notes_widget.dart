import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_to_do/Models/note.dart';
import 'package:note_to_do/Screens/note/note_pad.dart';
import 'package:note_to_do/constants/colors.dart';

class NotesWidget extends StatelessWidget {
  final Notes notes;

  const NotesWidget({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? tabColor() {
      final random = Random();
      var raColor = noteTabColors[random.nextInt(noteTabColors.length)];
      return raColor;
    }

    return Card(
      color: tabColor(),
      child: ListTile(
        title: Text(notes.title),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NotePad(notes: notes,)));
        },
      ),
    );
  }
}
