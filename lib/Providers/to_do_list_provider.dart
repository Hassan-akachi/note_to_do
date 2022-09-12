import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:note_to_do/Models/to_do.dart';

import '../Models/to_do_list.dart';

class ToDoListProvider extends ChangeNotifier {
  bool isToggle = false;

  int taskIndex = 0;

  final List<ToDoList> _todolists = [
    ToDoList(
      id: 1,
      addtodo: [ToDo(name: "to-do")],
      title: "Muhammad",
      //this is the model class
      createdListAt: DateTime.now(),
    ),
    ToDoList(
      title: "hassan",
      addtodo: [ToDo(name: "laugh")], //this is the model class
      createdListAt: DateTime.now(),
      id: 2,
    )
  ];

  DateTime selectTime = DateTime.now();

  UnmodifiableListView<ToDoList> get todolist {
    return UnmodifiableListView(_todolists);
  }

  //upate todolist
  void addTask(title, todolistsContents, createdAt, idNum) {
    if (_todolists[taskIndex].id == taskIndex) {
      //_todolists.map((e) => e.addtodo.add(todolistsContents)).toList();
      _todolists[taskIndex].addtodo= todolistsContents;
      final note = ToDoList(
          title: title,
          addtodo: todolistsContents,
          createdListAt: createdAt,
          id: idNum);
      _todolists[taskIndex]= note;
      notifyListeners();
    }
  }

  //create a new task
  void increaseTodolist() {
    final num = ToDoList(
        id: _todolists.length,
        title: '',
        addtodo: [ToDo(name: "note it 🗒️ check it ✔️", isChecked: true)]);
    taskIndex = _todolists.length;
    _todolists.add(num);
    print("this is a new page index ${_todolists[taskIndex].id}");
    notifyListeners();
  }

  // void setTime(time){
  //   selectTime=time;
  // }

  //delete task
  void deleteTask(ToDoList todolist) {
    _todolists.remove(todolist);
    notifyListeners();
  }

  void deleteAll(ToDoList toDoList) {
    _todolists.clear();
  }

  //todos

  // List<List<ToDos>> _todo= List.generate(length, (index) => [])

  // UnmodifiableListView<ToDos> get todos{
  //   return UnmodifiableListView(_todos);
  // }


  // create a todos
  void addTodo(newInputText) {
    final todoName = ToDo(name: newInputText);
    _todolists[taskIndex].addtodo.add(todoName);
    // _todolists.map((e) => e.addtodo.add(todoName));
    print("todo added");
    notifyListeners();
  }

  // void setTime(time){
  //   selectTime=time;
  // }

  void toggleCheck() {
    isToggle = !isToggle;
    notifyListeners();
  }

  //update the state of the checkbox
  void updateTodo(ToDo toDo) {
    toDo.toggleCheck();
    notifyListeners();
  }

  //delete task

  void deleteTodo(ToDo toDo) {
    _todolists[taskIndex].addtodo.remove(toDo);
    //_todolists.map((e) => e.addtodo.remove(stoDo));
    notifyListeners();
  }
}
