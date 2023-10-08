// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/helper/show_snakbar.dart';
import 'package:notes_app/helper/text_span_color.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class NotesItem extends StatelessWidget {
  NotesItem({super.key, required this.notes, this.query});

  final NotesModel notes;
  String? query;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        notes.delete();
        BlocProvider.of<NotesCubit>(context).fatchAllNotes();
        showSnakBar(context, 'The note has been successfully deleted');
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return EditNotesView(
                notes: notes,
              );
            },
          ));
        },
        child: Container(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 24,
            left: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(notes.color),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text.rich(
                  TextSpan(
                    children: highlightOccurrences(notes.title, query ?? ""),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: Text.rich(
                    TextSpan(
                      children:
                          highlightOccurrences(notes.subTitle, query ?? ""),
                    ),
                    style: TextStyle(
                      color: Colors.black.withOpacity(.4),
                      fontSize: 18,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    notes.delete();
                    BlocProvider.of<NotesCubit>(context).fatchAllNotes();
                    showSnakBar(
                        context, 'The note has been successfully deleted');
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    size: 28,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  notes.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
