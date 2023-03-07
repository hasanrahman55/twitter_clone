import 'package:flutter/material.dart';
import 'package:twitter_clone/theme/pallete.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    // useMaterial3: true,
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(backgroundColor: Pallete.backgroundColor),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Pallete.blueColor),
  );
}
