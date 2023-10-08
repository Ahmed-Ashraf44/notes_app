import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Notes/cubits/search_note/search_note_cubit.dart';
import 'package:Notes/models/notes_model.dart';
import 'package:Notes/views/widgets/notes_item.dart';
import 'package:Notes/views/widgets/notes_item_list.dart';

class SearchFinder extends StatelessWidget {
  final String query;

  const SearchFinder({super.key, required this.query});
  @override
  Widget build(BuildContext context) {
    return query.isEmpty
        ? const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: NotesItemList(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: NotesItemListSearch(
              query: query,
            ),
          );
  }
}

class NotesItemListSearch extends StatelessWidget {
  const NotesItemListSearch({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchNoteCubit(),
      child: BlocBuilder<SearchNoteCubit, SearchNoteState>(
        builder: (context, state) {
          BlocProvider.of<SearchNoteCubit>(context)
              .searchItem(query.toLowerCase());
          List<NotesModel>? result =
              BlocProvider.of<SearchNoteCubit>(context).notes ?? [];
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: result.isEmpty
                ? const Center(
                    child: Text(
                      'No results found !',
                      style: TextStyle(fontSize: 26),
                    ),
                  )
                : ListView.builder(
                    itemCount: result.length,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                        ),
                        child: NotesItem(
                          notes: result[index],
                          query: query,
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
