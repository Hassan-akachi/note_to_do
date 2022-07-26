

import 'dart:collection';

import 'package:flutter/material.dart';

import '../Models/to_do.dart';

class ToDoProvider extends ChangeNotifier{
 String todoText ="";

 String todoName(todo){
   todoText =todo;
   return todoText;
 }

  final List<ToDo>_todos=[
    ToDo(name: "todo",)
  ];
  bool isToggle =false;



  UnmodifiableListView<ToDo> get todos{
    return UnmodifiableListView(_todos);
  }

  void addTask(newInputText ){
    final todoName=ToDo(name: newInputText);
    _todos.add(todoName);
    notifyListeners();
  }
  // void setTime(time){
  //   selectTime=time;
  // }

  void toggleCheck(){
    isToggle = !isToggle;
    notifyListeners();
  }

  //update the state of the checkbox
  void updateTask (ToDo toDo){
    toDo.toggleCheck();
    notifyListeners();
  }

  //delete task
  void deleteTask(ToDo toDo){
    _todos.remove(toDo);
    notifyListeners();
  }

}