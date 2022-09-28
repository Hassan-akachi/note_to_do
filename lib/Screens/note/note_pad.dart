import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_to_do/constants/styles.dart';
import 'package:provider/provider.dart';

import '../../Models/note.dart';
import '../../Providers/notes_provider.dart';

class NotePad extends StatefulWidget {
  static const routeName = "NotePad-Screen";
  final Notes? notes;

  const NotePad({Key? key, this.notes}) : super(key: key);

  @override
  State<NotePad> createState() => _NotePadState();
}

class _NotePadState extends State<NotePad> {
  final TextEditingController notesContentsController = TextEditingController();
  final TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Consumer<NoteProvider>(
        builder: (BuildContext context, state, Widget? child) {
      title.text = widget.notes?.title ?? "";
      notesContentsController.text = widget.notes?.notesContents ?? "";
      DateTime now = widget.notes?.currentTime ?? DateTime.now();
      var formatter = DateFormat("yyy-MM-dd");
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "NotePad",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.attachment)),
            IconButton(
                onPressed: () {
                  state.addTask(
                      title.text, notesContentsController.text, state.noteIndex);
                  print(Provider.of<NoteProvider>(context, listen: false)
                      .noteIndex);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                textCapitalization: TextCapitalization.words,
                decoration: kEditTextDecoration.copyWith(
                  hintText: "TITLE",
                  labelText: "Title",
                ),
                controller: title,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${formatter.format(now)}   ${DateFormat('EEE,hh:mm a').format(now)}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 3,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "NOTES",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    ),
                  ),
                  controller: notesContentsController,
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

  @override
  void dispose() {
     notesContentsController.dispose();
     title.dispose();
     super.dispose();
  }
}
