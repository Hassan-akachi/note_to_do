import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_to_do/Providers/notes_provider.dart';
import 'package:note_to_do/Widgets/notes/notes_widget.dart';
import 'package:provider/provider.dart';

class NoteList extends StatelessWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(builder: (BuildContext context, state, Widget? child) {

      return Align(
        alignment: Alignment.topCenter,
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            reverse: true,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final note =state.notes[index];

              return Dismissible(key: Key(note.title),
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
              child: NotesWidget(notes: note));
            },
            itemCount: state.notes.length,
          ),
        ),
      );
    });
  }
}