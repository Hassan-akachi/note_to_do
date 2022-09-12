import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_to_do/constants/styles.dart';
import 'package:provider/provider.dart';

import '../../Models/note.dart';
import '../../Providers/notes_provider.dart';

class NotePad extends StatelessWidget {
  static const routeName = "NotePad-Screen";
  final Notes? notes;

  const NotePad({Key? key, this.notes}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final TextEditingController notesContents = TextEditingController();
    final TextEditingController title = TextEditingController();
    return Consumer<NoteProvider>(builder: (BuildContext context, state, Widget? child) {
    title.text =notes?.title ??"";
    notesContents.text =notes?.notesContents ?? "";
    DateTime now  =notes?.currentTime ?? DateTime.now();
    var formatter =DateFormat("yyy-MM-dd");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NotePad",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {
                    state.addTask(title.text, notesContents.text, state.noteIndex);
                print( Provider.of<NoteProvider>(context, listen: false).noteIndex);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 1,
                child: TextField(
                  textCapitalization: TextCapitalization.words,
                  decoration: kEditTextDecoration.copyWith(
                    hintText: "TITLE",
                    labelText: "Title",
                  ),
                  controller: title,
                )),
            Text("${formatter.format(now)}   ${DateFormat('EEE,hh:mm a').format(now)}", style: const TextStyle(fontSize: 20),),
            const SizedBox(height: 20,),
            Expanded(
              flex: 3,
              child: TextField(
                decoration: kEditTextDecoration.copyWith(
                    labelText: "Note", hintText: "To-do/ Note "),
                controller: notesContents,
                scrollPadding: const EdgeInsets.all(20.0),
                keyboardType: TextInputType.multiline,
                maxLines: 99999,
                autofocus: true,
              ),
            )
          ],
        ),
      ),
    );
    });
  }
}
