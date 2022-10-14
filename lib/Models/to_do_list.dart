
import 'package:note_to_do/Models/to_do.dart';

class ToDoList {
   int id;
  final String title;
   DateTime createdListAt;
   List<ToDo> addtodo;
   bool isSwitched;

  ToDoList({
    required this.id,
    required this.title,
    required this.addtodo,
    required this.createdListAt,//DateTime? createdListAt
    required this.isSwitched,
   }); //:this.createdListAt = createdListAt ?? DateTime.now();

   void toggleSwitched(){
     isSwitched = !isSwitched;
   }
}