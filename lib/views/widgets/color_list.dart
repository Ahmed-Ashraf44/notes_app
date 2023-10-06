import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:notes_app/views/widgets/color_item.dart';


class ColorList extends StatefulWidget {
 const ColorList({super.key});

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  final List<Color> itemColor = const [
    Color(0xff3A86FF),
    Color(0xff8338EC),
    Color(0xffFF006E),
    Color(0xffFB5607),
    Color(0xffFFBE0B),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: itemColor.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNotesCubit>(context).color = itemColor[index];
                setState(() { 
                });
              },
              child: Coloritems(
                  color: itemColor[index], isActive: currentIndex == index),
            ),
          );
        },
      ),
    );
  }
}