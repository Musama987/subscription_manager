import 'package:flutter/material.dart';

class AppColors {
  // Primary Backgrounds
  static const Color scaffoldBackground = Color(0xFF0B1019);
  static const Color cardBackground = Color(0xFF161C28);
  static const Color surfaceBackground = Color(0xFF1F2633);

  // Accents & Gradients
  static const Color primaryCyan = Color(0xFF32D4E1);
  static const Color primaryBlue = Color(0xFF1E88E5);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryCyan, primaryBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient premiumGradient = LinearGradient(
    colors: [Color(0xFFFF7D45), Color(0xFFFF416C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient plusButtonGradient = LinearGradient(
    colors: [Color(0xFF22D6CB), Color(0xFF0FA6E5)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFF8E99A9);
  static const Color textTertiary = Color(0xFF5C6672);

  // Semantic Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFFF5252);
  static const Color warning = Color(0xFFFFAB40);

  // Category Specific (Extracted from Analytics/Home)
  static const Color catSoftware = Color(0xFF5C6BC0);
  static const Color catEntertainment = Color(0xFFFF5252);
  static const Color catHealth = Color(0xFFFFB74D);
  static const Color catMusic = Color(0xFFBA68C8);
}
