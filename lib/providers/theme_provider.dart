import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false);

  void changeTheme(bool v) {
    state = v;
  }
}

final themeProvider =
    StateNotifierProvider<ThemeNotifier, bool>((ref) => ThemeNotifier());
