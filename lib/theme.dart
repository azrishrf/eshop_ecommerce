import 'package:flutter/material.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
        primaryColor: Palette.primary,
        textTheme: base.textTheme.copyWith(
          displayLarge: GoogleFonts.poppins(
            fontSize: 24,
            height: 1.3,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            height: 1.5,
            color: Colors.black,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 14,
            height: 1.5,
            color: Colors.black,
          ),
          bodySmall: GoogleFonts.poppins(
            fontSize: 12,
            height: 1.5,
            color: Colors.black,
          ),
        ));
  }
}
