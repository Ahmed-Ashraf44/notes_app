import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Notes/constants.dart';
import 'package:Notes/models/notes_model.dart';

part 'search_note_state.dart';

class SearchNoteCubit extends Cubit<SearchNoteState> {
  SearchNoteCubit() : super(SearchNoteInitial());

  List<NotesModel>? notes;
  searchItem(String searchTerm) {
    var noteBox = Hive.box<NotesModel>(kNotesBox);
    notes = noteBox.values
            .where((element) => element.title.contains(searchTerm))
            .toList() +
        noteBox.values
            .where((element) => element.subTitle.contains(searchTerm))
            .toList();
    emit(SearchNoteSuccess());
  }
}
