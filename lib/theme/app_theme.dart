import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color deepOrange = Color(0xFFE85D26);
  static const Color warmOrange = Color(0xFFF28B30);
  static const Color goldenYellow = Color(0xFFFFC857);
  static const Color twilightBlue = Color(0xFF2B4570);
  static const Color deepNavy = Color(0xFF1B2A4A);
  static const Color softCoral = Color(0xFFFF8A6C);
  static const Color paleGold = Color(0xFFFFF0D1);
  static const Color warmWhite = Color(0xFFFFFBF5);
  static const Color cardDark = Color(0xFF243B63);
  static const Color textLight = Color(0xFFF5E6D3);
  static const Color textMuted = Color(0xFFB0BEC5);

  static const LinearGradient sunsetGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF28B30),
      Color(0xFFE85D26),
      Color(0xFF7B2D5F),
      Color(0xFF2B4570),
    ],
    stops: [0.0, 0.3, 0.65, 1.0],
  );

  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFE85D26),
      Color(0xFFF28B30),
      Color(0xFFFFB347),
    ],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFE85D26),
      Color(0xFFF28B30),
    ],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF2B4570),
      Color(0xFF1B2A4A),
    ],
  );
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.deepNavy,
      colorScheme: ColorScheme.dark(
        primary: AppColors.deepOrange,
        secondary: AppColors.warmOrange,
        tertiary: AppColors.goldenYellow,
        surface: AppColors.cardDark,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textLight,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData.dark().textTheme,
      ),
      cardTheme: CardThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: AppColors.cardDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.deepNavy.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.twilightBlue.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.twilightBlue.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.warmOrange, width: 2),
        ),
        labelStyle: const TextStyle(color: AppColors.textMuted),
        prefixIconColor: AppColors.warmOrange,
      ),
    );
  }
}
