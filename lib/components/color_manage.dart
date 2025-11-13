import 'package:flutter/material.dart';

class AppColors {
  static Color grey(int shade) {
    return _grey[shade] ?? _grey[2]!;
  }

  static const Map<int, Color> _grey = {
    1: Color(0xFFFDFDFD),
    2: Color(0xFFF6F6F6),
    3: Color(0xFFF0F0F0),
    4: Color(0xFFD9D9D9),
    5: Color(0xFFB6FD03),
    6: Color(0xFFA5A5A5),
    7: Color(0xFF757575),
    8: Color(0xFF5C5C5C),
    9: Color(0xFF1E1E1E)
  };

  static Color cyan(int shade) {
    return _cyan[shade] ?? _cyan[5]!;
  }

  static const Map<int, Color> _cyan = {
    1: Color(0xFF5B9FF1),
    2: Color(0xFF7AB6FD),
    3: Color(0xFFD5F1FA),
    4: Color(0xFF33F6FF),
    5: Color(0xFF00F4FF),
    6: Color(0xFF00E8F7),
    7: Color(0xFF00D8E1),
    8: Color(0xFF00C3CC),
    9: Color(0xFF009299)
  };

  static Color yellow() {
    return Color(0xFFFFE342);
  }

  static Color red() {
    return Color(0xFFD24D4D);
  }

  static Color green() {
    return Color(0xFF35BC37);
  }

  static Color mint() {
    return Color(0xFF5ACCC4);
  }

  static Color purple() {
    return Color(0xFF9B59FF);
  }

  static Color orange() {
    return Color(0xFFFF9E75);
  }
}
