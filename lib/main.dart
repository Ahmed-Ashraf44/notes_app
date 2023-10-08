import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Notes/constants.dart';
import 'package:Notes/cubits/notes/notes_cubit.dart';
import 'package:Notes/cubits/switch_theme/switch_theme_cubit.dart';
import 'package:Notes/models/notes_model.dart';
import 'package:Notes/simple_bloc_observer.dart';
import 'package:Notes/views/notes_view.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

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
            home: AnimatedSplashScreen(
              splashTransition: SplashTransition.scaleTransition,
              splashIconSize: 200,
              backgroundColor: Colors.white,
              splash: const CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage(
                  'assets/images/splash.jpg',
                ),
              ),
              nextScreen: const NotesView(),
            ),
          );
        },
      ),
    );
  }
}
