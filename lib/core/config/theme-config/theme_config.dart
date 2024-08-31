import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theme_config.g.dart';

ThemeData darkTheme = ThemeData.dark();

final TextTheme commonTextTheme = TextTheme(
  displayLarge: GoogleFonts.jost(
    color: Colors.white,
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
  ),
  bodyLarge: GoogleFonts.jost(
    color: Colors.white,
    fontSize: 16.0,
  ),
  bodyMedium: GoogleFonts.jost(
      color: const Color(0xFFB3B3B3),
      fontSize: 14.0,
      fontWeight: FontWeight.w500),
  labelLarge: GoogleFonts.jost(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  ),
);

const ButtonThemeData commonButtonTheme = ButtonThemeData(
  buttonColor: Color(0xFFFFB900),
  textTheme: ButtonTextTheme.primary,
);

const AppBarTheme commonAppBarTheme = AppBarTheme(
  backgroundColor: Color(0xFF1E1E1E),
  elevation: 0,
  iconTheme: IconThemeData(color: Colors.white),
);

final InputDecorationTheme commonInputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: const Color(0xFF2B2B2B),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide.none,
  ),
  hintStyle: GoogleFonts.jost(color: const Color(0xFF848484), fontSize: 20),
  labelStyle: GoogleFonts.jost(
    color: Colors.white,
  ),
);

const IconThemeData commonIconTheme = IconThemeData(
  color: Color(0xFFF0C419),
);

const FloatingActionButtonThemeData commonFabTheme =
    FloatingActionButtonThemeData(
  backgroundColor: Color(0xFFFFB900),
);

@riverpod
ThemeConfig themeConfig(ThemeConfigRef ref) => ThemeConfig();

class ThemeConfig {
  ThemeData fruitTheme = darkTheme.copyWith(
    primaryColor: const Color(0xFFFFB900),
    scaffoldBackgroundColor: const Color(0xFF1A1200),
    cardColor: const Color(0xFF2B2B2B),
    textTheme: commonTextTheme,
    buttonTheme: commonButtonTheme,
    appBarTheme: commonAppBarTheme,
    inputDecorationTheme: commonInputDecorationTheme,
    iconTheme: commonIconTheme,
    floatingActionButtonTheme: commonFabTheme,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFF0C419)),
  );

  ThemeData vegetebleTheme = darkTheme.copyWith(
    primaryColor: const Color(0xFF91D952),
    scaffoldBackgroundColor: const Color(0xFF0C1A00),
    cardColor: const Color(0xFF2B2B2B),
    textTheme: commonTextTheme,
    buttonTheme: commonButtonTheme,
    appBarTheme: commonAppBarTheme,
    inputDecorationTheme: commonInputDecorationTheme.copyWith(),
    iconTheme: commonIconTheme,
    floatingActionButtonTheme: commonFabTheme,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: const Color(0x000000ff)),
  );
}
