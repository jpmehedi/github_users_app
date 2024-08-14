import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.dark;
});

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  void toggleDark() {
    _themeData = ThemeData.dark();
    notifyListeners();
  }

  void toggleLight() {
    _themeData = ThemeData.light();
    notifyListeners();
  }
}


