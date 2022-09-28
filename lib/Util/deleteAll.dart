import 'package:flutter/material.dart';

void deleteAll(BuildContext context, int tabNum) {
  showDialog(context: context, builder: (BuildContext context) {
   return AlertDialog(title: const Icon(Icons.warning_amber,color: Colors.red,size: 30,),
     content: Text(tabNum == 0
        ? "Are you sure want to delete all todoList"
        : "Are you sure want to delete all Notes"),
   actions: [
     OutlinedButton(onPressed: (){},
         child:const Text("Yes") ),
     OutlinedButton(onPressed: (){Navigator.of(context).pop();},
         child:const Text("No") )
   ],);
  },);
}