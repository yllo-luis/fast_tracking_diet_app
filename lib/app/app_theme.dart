import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final scaffoldBackgroundColorLight = Colors.white;
  static final scaffoldBackgroundColorDark = const Color(0xFF121212);

  static final ThemeData appThemeDarkMode = ThemeData(
    scaffoldBackgroundColor: scaffoldBackgroundColorLight,
    textTheme: TextTheme(
      bodySmall: GoogleFonts.inter(color: Colors.white, fontSize: 14),
      bodyMedium: GoogleFonts.inter(color: Colors.white, fontSize: 16),
      bodyLarge: GoogleFonts.inter(color: Colors.white, fontSize: 18),
      headlineSmall: GoogleFonts.inter(color: Colors.white, fontSize: 22),
      displayMedium: GoogleFonts.inter(color: Colors.white, fontSize: 26),
      displayLarge: GoogleFonts.inter(color: Colors.white, fontSize: 28),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      fillColor: Colors.transparent,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black38),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.purple),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    useMaterial3: true,
  );

  static final ThemeData appThemeLightMode = ThemeData(
    scaffoldBackgroundColor: scaffoldBackgroundColorLight,
    textTheme: TextTheme(
      bodySmall: GoogleFonts.inter(color: Colors.black, fontSize: 14),
      bodyMedium: GoogleFonts.inter(color: Colors.black, fontSize: 16),
      bodyLarge: GoogleFonts.inter(color: Colors.black, fontSize: 18),
      headlineSmall: GoogleFonts.inter(color: Colors.black, fontSize: 22),
      displayMedium: GoogleFonts.inter(color: Colors.black, fontSize: 26),
      displayLarge: GoogleFonts.inter(color: Colors.black, fontSize: 28),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      fillColor: Colors.transparent,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black38),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.purple),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    useMaterial3: true,
  );
}
