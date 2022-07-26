

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:note_to_do/Models/note.dart';


class NoteProvider extends ChangeNotifier{

  final List<Notes>_notes=[
    Notes(title: "Muhammad", notesContents: "notesContents")
  ];
  DateTime selectTime=DateTime.now();


  UnmodifiableListView<Notes> get notes{
    return UnmodifiableListView(_notes);
  }

  void addTask(title,notesContents){
    final note=Notes(title: title, notesContents: notesContents);
    _notes.add(note);
    notifyListeners();
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
    _notes.remove(notes);
    notifyListeners();
  }

}