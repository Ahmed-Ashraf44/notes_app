import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/widgets/note_item_grid.dart';

class NotesItemGridList extends StatelessWidget {
  const NotesItemGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NotesModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: .8,
            mainAxisSpacing: 10,
          ),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NotesItemGrid(notes: notes[index]);
          },
        );
      },
    );
  }
}
