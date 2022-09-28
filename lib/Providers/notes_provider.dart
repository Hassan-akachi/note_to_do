

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:note_to_do/Models/note.dart';


class NoteProvider extends ChangeNotifier{

  int noteIndex = 0;

  final List<Notes>innernotes=[
    Notes(title: "Muhammad", notesContents: "notesContents", id: 1)
  ];
  DateTime selectTime=DateTime.now();


  UnmodifiableListView<Notes> get notes{
    return UnmodifiableListView(innernotes);
  }

  void addTask(title,notesContents,noteId){
    final note=Notes(title: title, notesContents: notesContents, id: noteId);
    if(noteIndex< notes.length){
      innernotes[noteIndex]=note;
      notifyListeners();
    }
    else{
      innernotes.add(note);
      notifyListeners();

    }
  }
  // void setTime(time){
  //   selectTime=time;
  // }


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