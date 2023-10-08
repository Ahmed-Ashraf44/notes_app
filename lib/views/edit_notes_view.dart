import 'package:flutter/material.dart';
import 'package:Notes/models/notes_model.dart';
import 'package:Notes/views/widgets/edit_notes_body.dart';

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
