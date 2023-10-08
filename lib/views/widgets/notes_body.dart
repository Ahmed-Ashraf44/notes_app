import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/cubits/switch_theme/switch_theme_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/widgets/custom_search_icon.dart';
import 'package:notes_app/views/widgets/notes_item_grid_list.dart';
import 'package:notes_app/views/widgets/notes_item_list.dart';
import 'package:notes_app/views/widgets/search_item.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({super.key});

  @override
  State<NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  bool select = true;

  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fatchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Notes',
                      style: TextStyle(fontSize: 30),
                    ),
                    BlocBuilder<NotesCubit, NotesState>(
                      builder: (context, state) {
                        List<NotesModel> notes =
                            BlocProvider.of<NotesCubit>(context).notes ?? [];
                        return Text(
                          '${notes.length} notse',
                        );
                      },
                    ),
                  ],
                ),
                const Spacer(),
                CustomIcon(
                  icon: Icons.search,
                  onPressed: () {
                    showSearch(context: context, delegate: SearchItem());
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomIcon(
                  icon: Icons.brightness_2,
                  onPressed: () {
                    BlocProvider.of<ThemeCubit>(context).toggleTheme();
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomIcon(
                  icon: select ? Icons.list_sharp : Icons.grid_view_rounded,
                  onPressed: () {
                    select = !select;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: select ? const NotesItemList() : const NotesItemGridList(),
          ),
        ],
      ),
    );
  }
}
