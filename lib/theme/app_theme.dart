
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade200,
  textTheme: GoogleFonts.latoTextTheme(),
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade100,
    primary: Colors.grey.shade200,
    secondary: Colors.black,
    tertiary: Colors.white,
  ),
);