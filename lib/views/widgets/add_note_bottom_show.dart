import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_notes_states.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/helper/show_snakbar.dart';
import 'package:notes_app/views/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesStates>(
        listener: (context, state) {
          if (state is AddNotesFaulireState) {
            debugPrint('failed ${state.errorMasseges}');
          }
          if (state is AddNotesSuccesState) {
            BlocProvider.of<NotesCubit>(context).fatchAllNotes();
            Navigator.pop(context);
            showSnakBar(context, 'The note has been successfully added');
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNotesLoadingState ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
