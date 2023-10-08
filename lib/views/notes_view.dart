import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/add_note_bottom_show.dart';
import 'package:notes_app/views/widgets/notes_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)),
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const NotesBody(),
    );
  }
}
