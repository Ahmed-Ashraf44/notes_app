import 'package:flutter/material.dart';
import 'package:Notes/constants.dart';
import 'package:Notes/models/notes_model.dart';
import 'package:Notes/views/widgets/color_item.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.notes});

  final NotesModel notes;
  @override
  State<EditNoteColorList> createState() => _ColorListState();
}

class _ColorListState extends State<EditNoteColorList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColor.indexOf(Color(widget.notes.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: kColor.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.notes.color = kColor[currentIndex].value;
                setState(() {});
              },
              child: Coloritems(
                  color: kColor[index], isActive: currentIndex == index),
            ),
          );
        },
      ),
    );
  }
}
