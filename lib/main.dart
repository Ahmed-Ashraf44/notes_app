import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/cubits/switch_theme/switch_theme_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/animated_splash_view.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObServer();
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>(kNotesBox);

  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: const NotesApp(),
  ));
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: const AnimatedSplashView(),
          );
        },
      ),
    );
  }
}
