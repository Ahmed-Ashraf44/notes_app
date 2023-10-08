import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notes_app/views/notes_view.dart';

class FirstView extends StatefulWidget {
  const FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const NotesView();
          },
        ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/notes.jpg',
          width: 200,
        ),
      ],
    );
  }
}
