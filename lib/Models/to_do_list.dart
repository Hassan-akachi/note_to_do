
import 'package:note_to_do/Models/to_do.dart';

class ToDoList {
   int id;
  final String title;
  late final DateTime createdListAt;
   List<ToDo> addtodo;

  ToDoList({
    required this.id,
    required this.title,
    required this.addtodo,
    DateTime? createdListAt, 
  }) : createdListAt = createdListAt ?? DateTime.now();
}