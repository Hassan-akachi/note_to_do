import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_to_do/Providers/notes_provider.dart';
import 'package:provider/provider.dart';

import '../../Res/colors.dart';
import '../../Screens/note/note_pad.dart';



class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
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
          child: ReorderableListView.builder(
            padding: EdgeInsets.zero,
            reverse: true,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final note = state.notes[index];

              return Dismissible(
                  key: ValueKey(note),
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
                      key: ValueKey(note),
                      title: Text(note.title),
                      leading: const Icon(Icons.drag_indicator_outlined),
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
                        trailing: Text(
                          DateFormat('EEE,hh:mm a')
                              .format(note.createdListAt),
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey),
                        )
                    ),
                  ));
            },
            itemCount: state.notes.length,
            onReorder: (int oldIndex, int newIndex) {
              setState((){
                final index = newIndex > oldIndex ?newIndex -1 :newIndex;
                final user = state.innernotes.removeAt(oldIndex);
                state.innernotes.insert(index, user);

              });
            },
          ),
        ),
      );
    });
  }
}
