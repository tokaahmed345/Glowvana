import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/theme/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme.morningTheme);
  void switchToMorning()=>emit(AppTheme.morningTheme);
    void switchToNight()=>emit(AppTheme.nightTheme);


}
