import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  Brightness theme = Brightness.light;
  changeTheme() {
    if (theme == Brightness.light) {
      theme = Brightness.dark;
    } else {
      theme = Brightness.light;
    }
    emit(ThemeSuccess());
  }
}
