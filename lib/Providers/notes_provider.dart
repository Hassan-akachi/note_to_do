

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:note_to_do/Models/note.dart';


class NoteProvider extends ChangeNotifier{

  int noteIndex = 0;
  DateTime setdatetime =DateTime.now();

  final List<Notes>innernotes=[
    Notes(title: "Muhammad", notesContents: "notesContents", id: 1, createdListAt: DateTime.now(),)
  ];
  UnmodifiableListView<Notes> get notes{
    return UnmodifiableListView(innernotes);
  }

  void addTask(title,notesContents,noteId,createdAt){
    final note=Notes(title: title, notesContents: notesContents, id: noteId, createdListAt:createdAt);
    if(noteIndex< notes.length){
      innernotes[noteIndex]=note;
      notifyListeners();
    }
    else{
      innernotes.add(note);
      notifyListeners();

    }
  }
  //set time
  void setTime(time){
    innernotes[noteIndex].createdListAt=time;
    notifyListeners();
  }

  //update the state of the checkbox
  // void updateTask (Notes notes){
  //   notes.toggleCheck();
  //   notifyListeners();
  // }

  //delete task
  void deleteTask(Notes notes){
    innernotes.remove(notes);
    notifyListeners();
  }

}