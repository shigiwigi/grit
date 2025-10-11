import 'package:flutter/material.dart';

// Primary Colors based on the model's aesthetic
const Color primaryDark = Color(0xFF0F172A);
const Color secondaryDark = Color(0xFF1E293B);
const Color primaryBlue = Color(0xFF3B82F6);
const Color secondaryBlue = Color(0xFF2563EB);
const Color neonBlue = Color(0xFF60A5FA);
const Color textPrimary = Colors.white;
const Color textSecondary = Color(0xFF9CA3AF);
const Color accentBlueGradientStart = Color(0xFF2E7AD6);
const Color accentBlueGradientEnd = Color(0xFF5A80F5);

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: primaryDark,
  colorScheme: const ColorScheme.dark(
    primary: primaryBlue,
    secondary: secondaryBlue,
    background: primaryDark,
    surface: secondaryDark,
    onPrimary: textPrimary,
    onSecondary: textPrimary,
    onSurface: textPrimary,
  ),

  // ✅ Fixed: Use CardThemeData instead of CardTheme
  cardTheme: CardThemeData(
    color: secondaryDark.withOpacity(0.8),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(color: neonBlue.withOpacity(0.2)),
    ),
  ),

  iconTheme: IconThemeData(
    color: textPrimary.withOpacity(0.8),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: textPrimary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);
