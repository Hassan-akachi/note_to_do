
import 'package:note_to_do/Models/to_do.dart';

class ToDoList {
  final String title;
  late final DateTime createdListAt;
   final List<ToDo> addtodo;

  ToDoList({
    required this.title,
    required this.addtodo,
    DateTime? createdListAt, 
  }) : createdListAt = createdListAt ?? DateTime.now();
}