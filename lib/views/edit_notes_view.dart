import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/widgets/edit_notes_body.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key, required this.notes});
  final NotesModel notes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(notes: notes),
    );
  }
}
