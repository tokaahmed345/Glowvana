import 'dart:ui';

import 'package:bloc/bloc.dart';

class ThemeCubit extends Cubit<Brightness> {
  ThemeCubit() : super(Brightness.light);
  void switchToMorning()=>emit(Brightness.light);

    void switchToNight()=>emit(Brightness.dark);


}
