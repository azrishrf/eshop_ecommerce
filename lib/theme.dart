import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
        primaryColor: Palette.primary,
        textTheme: base.textTheme.copyWith(
          displayLarge: GoogleFonts.jost(
            fontSize: 24,
            height: 1.3,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: GoogleFonts.jost(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          // displaySmall: base.textTheme.displaySmall?.copyWith(
          //   fontSize: Dimens.size20,
          //   height: Dimens.displaySmallLineHeight,
          //   fontWeight: FontWeight.w500,
          // ),
          bodyLarge: GoogleFonts.jost(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
          bodyMedium: GoogleFonts.jost(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
          bodySmall: GoogleFonts.jost(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ));
  }
}