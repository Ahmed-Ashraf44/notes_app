import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/helper/show_snakbar.dart';
import 'package:notes_app/views/widgets/custom_appbar_edit.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/widgets/edit_note_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.notes});

  final NotesModel notes;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomAppBarEdit(
            onPressed: () {
              widget.notes.title = title ?? widget.notes.title;
              widget.notes.subTitle = content ?? widget.notes.subTitle;
              widget.notes.save();
              BlocProvider.of<NotesCubit>(context).fatchAllNotes();
              Navigator.pop(context);
              showSnakBar(context, 'The note has been successfully modified');
            },
            title: 'Edit Notes',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            initialValue: widget.notes.title,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            initialValue: widget.notes.subTitle,
            maxLines: 5,
            onChanged: (value) {
              content = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorList(
            notes: widget.notes,
          ),
        ],
      ),
    );
  }
}
