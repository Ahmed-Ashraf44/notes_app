import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Notes/constants.dart';
import 'package:Notes/cubits/add_note_cubit/add_notes_states.dart';
import 'package:Notes/models/notes_model.dart';

class AddNotesCubit extends Cubit<AddNotesStates> {
  AddNotesCubit() : super(AddNotesinitialState());
  Color color = const Color(0xff3A86FF);
  getNotes(NotesModel notes) async {
    notes.color = color.value;
    emit(AddNotesLoadingState());
    try {
      var addNotes = Hive.box<NotesModel>(kNotesBox);
      await addNotes.add(notes);
      emit(AddNotesSuccesState());
    } catch (e) {
      emit(AddNotesFaulireState(errorMasseges: e.toString()));
    }
  }
}
