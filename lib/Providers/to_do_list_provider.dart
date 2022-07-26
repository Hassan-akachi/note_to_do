import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:note_to_do/Models/to_do.dart';

import '../Models/to_do_list.dart';


class ToDoListProvider extends ChangeNotifier{

  bool isToggle =false;

  final List<ToDoList>_todolists=[
    ToDoList(title: "Muhammad", addtodo: [ToDo(name: "to-do")], createdListAt: DateTime.now() )
  ];

  DateTime selectTime=DateTime.now();


  UnmodifiableListView<ToDoList> get todolist{
    return UnmodifiableListView(_todolists);
  }

  void addTask(title, todolistsContents,createdAt){
    _todolists.map((e) => e.addtodo.add(todolistsContents)).toList();
    final note=ToDoList(title: title, addtodo: todolistsContents,createdListAt: createdAt);
    _todolists.add(note);
    notifyListeners();
  }
  // void setTime(time){
  //   selectTime=time;
  // }

  //delete task
  void deleteTask(ToDoList todolist){
    _todolists.remove(todolist);
    notifyListeners();
  }



  void deleteAll(ToDoList toDoList){
    _todolists.clear();
  }
  //todos

   // List<List<ToDos>> _todo= List.generate(length, (index) => [])



  // UnmodifiableListView<ToDos> get todos{
  //   return UnmodifiableListView(_todos);
  // }

  void addTodo(newInputText ){
    final todoName=ToDo(name: newInputText);
    _todolists.map((e) => e.addtodo.add(todoName));
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
  void updateTodo (ToDo toDo){
    toDo.toggleCheck();
    notifyListeners();
  }

  //delete task

  void deleteTodo(ToDo toDo){
    _todolists.map((e) => e.addtodo.remove(toDo));
    notifyListeners();
  }

}