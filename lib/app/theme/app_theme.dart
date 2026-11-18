import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFF3978E8);
  static const secondary = Color(0xFF20BFA9);
  static const accent = Color(0xFFFFC857);
  static const purple = Color(0xFF8B6CE8);

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        colorScheme: ColorScheme.fromSeed(seedColor: primary, primary: primary,
            secondary: secondary, surface: Colors.white),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: Color(0xFF17243A)),
          headlineMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Color(0xFF17243A)),
          titleLarge: TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: Color(0xFF17243A)),
          bodyLarge: TextStyle(fontSize: 15, color: Color(0xFF65738A)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true, fillColor: const Color(0xFFF7F9FC),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      );
}
