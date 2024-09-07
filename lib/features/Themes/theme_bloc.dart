import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<bool, bool> {
  late SharedPreferences _preference;

  ThemeBloc() : super(false) {
    _initializePreferences().then((_) {
      on<bool>(_onChangeTheme);
    }).catchError((error) {
      log('$error');
    });
  }

  Future<void> _initializePreferences() async {
    try {
      SharedPreferences.getInstance()
          .then((preference) => _preference = preference);
    } catch (e) {
      log('$e');
    }
  }

  bool? _getSavedTheme() {
    bool? isDarkTheme = _preference.getBool('themes') ?? false;
    return isDarkTheme;
  }

  Future<void> _onChangeTheme(bool event, Emitter<bool> emit) async {
    try {
      bool? selectedTheme = _getSavedTheme();
      selectedTheme = selectedTheme ?? false ? false : true;

      await _preference.setBool('themes', selectedTheme);

      emit(selectedTheme);
    } catch (e) {
      print('Error changing theme: $e');
    }
  }
}
