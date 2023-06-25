import 'package:encryptra/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  BuildContext context;
  CustomTheme({required this.context});

  static ThemeData theme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 5.0,
          backgroundColor: Colors.deepPurple[400],
          foregroundColor: Colors.white,
          fixedSize: Size(getWidth(context) * .4, 50),
          padding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 16,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.deepPurple,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.ysabeau(), 
      ),
    );
  }
}
