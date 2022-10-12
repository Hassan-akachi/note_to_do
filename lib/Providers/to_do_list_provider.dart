import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:note_to_do/Models/to_do.dart';

import '../Models/to_do_list.dart';

class ToDoListProvider extends ChangeNotifier {
  bool isToggle = false;

  int taskIndex = 0;

  final List<ToDoList> innertodolists = [
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
      id: 2,isSwitched: false
    )
  ];



  UnmodifiableListView<ToDoList> get todolist {
    return UnmodifiableListView(innertodolists);
  }

  //upate todolist
  void addTask(title, todolistsContents, createdAt, idNum,isSwitch) {
    if (innertodolists[taskIndex].id == taskIndex) {
      //_todolists.map((e) => e.addtodo.add(todolistsContents)).toList();
      innertodolists[taskIndex].addtodo= todolistsContents;
      final note = ToDoList(
          title: title,
          addtodo: todolistsContents,
          createdListAt: createdAt,
          id: idNum,isSwitched: isSwitch );
      innertodolists[taskIndex]= note;
      notifyListeners();
    }
  }

  //create a new task
  void increaseTodolist() {
    final num = ToDoList(
        id: innertodolists.length,
        title: '',
        addtodo: [ToDo(name: "note it 🗒️ check it ✔️", isChecked: true)], createdListAt: DateTime.now(),isSwitched: false );
    taskIndex = innertodolists.length;
    innertodolists.add(num);
    print("this is a new page index ${innertodolists[taskIndex].id}");
    notifyListeners();
  }

  //set time
  void setTime(now,context){
    DatePicker.showDateTimePicker(context,
        showTitleActions: true, minTime: DateTime.now(),
        // maxTime: DateTime(2023, 6, 7),
        onChanged: (date) {
          print('change $date');
        }, onConfirm: (date) {
          now = date;
          innertodolists[taskIndex].createdListAt =now;
          notifyListeners();
          print('confirm $now');
        }, currentTime: DateTime.now(), locale: LocaleType.en);
    notifyListeners();
  }

  //update switch
  void updateSwitch(ToDoList? toDoList) {
    toDoList?.toggleSwitched();
    notifyListeners();
  }
  void switched(bool isSet){
    isSet = !isSet;
    innertodolists[taskIndex].isSwitched = isSet;
    notifyListeners();
  }

  //delete task
  void deleteTask(ToDoList todolist) {
    innertodolists.remove(todolist);
    notifyListeners();
  }

  void deleteAll(ToDoList toDoList) {
    innertodolists.clear();
    notifyListeners();
  }

  //todos




  // create a todos
  void addTodo(newInputText) {
    final todoName = ToDo(name: newInputText);
    innertodolists[taskIndex].addtodo.add(todoName);
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
    innertodolists[taskIndex].addtodo.remove(toDo);
    //_todolists.map((e) => e.addtodo.remove(stoDo));
    notifyListeners();
  }
}
