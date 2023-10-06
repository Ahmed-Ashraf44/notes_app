import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AppTheme { light, dark }

class ThemeState {
  final ThemeData themeData;

  ThemeState(this.themeData);
}

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(_buildDarkTheme()));

  void toggleTheme() {
    final newTheme = state.themeData.brightness == Brightness.dark
        ? _buildLightTheme()
        : _buildDarkTheme();

    emit(ThemeState(newTheme));
  }

  static ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Poppins',
    );
  }

  static ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Poppins',
    );
  }
}
