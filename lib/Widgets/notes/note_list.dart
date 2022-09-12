import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_to_do/Providers/notes_provider.dart';
import 'package:provider/provider.dart';

import '../../Screens/note/note_pad.dart';
import '../../constants/colors.dart';

class NoteList extends StatelessWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
        builder: (BuildContext context, state, Widget? child) {
      Color? tabColor() {
        final random = Random();
        var raColor = noteTabColors[random.nextInt(noteTabColors.length)];
        return raColor;
      }

      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            reverse: true,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final note = state.notes[index];

              return Dismissible(
                  key: Key(note.title),
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
                    state.deleteTask(note);
                  },
                  child: Card(
                    color: tabColor(),
                    child: ListTile(
                      title: Text(note.title),
                      onTap: () {
                        state.noteIndex = index;
                        print(state.noteIndex);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotePad(
                                      notes: note,
                                    )));
                      },
                    ),
                  ));
            },
            itemCount: state.notes.length,
          ),
        ),
      );
    });
  }
}
