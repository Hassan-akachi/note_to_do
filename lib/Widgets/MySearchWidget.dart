import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/note.dart';
import '../Providers/notes_provider.dart';
import '../Screens/note/note_pad.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          return close(context, null); // close searchBar
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            } // clear search bar
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Notes> noteSuggestions =
    Provider.of<NoteProvider>(context).notes.where((noteSearchResult) {
      final result = noteSearchResult.title.toLowerCase();
      final searchLower = query.toLowerCase();
      return result.contains(searchLower);
    }).toList();
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        final note = noteSuggestions[index];

        return InkWell(
          child: ListTile(
            title: Text(note.title),
          ),
          onTap: () {
            query = note.title;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotePad(
                      notes: note,
                    )));
          },
        );
      },
      itemCount: noteSuggestions.length,
    );
  }
}
