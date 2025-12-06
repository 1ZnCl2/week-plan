import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/category/category_model.dart';

final categoryColorProvider =
    StateProvider<CategoryColor>((ref) => CategoryColor.black);

enum CategoryColor {
  blue('0xFF5B9FF1', '0xFFD5F1FA', '0xFF407283'),
  mint('0xFF5ACCC4', '0xFFDFF8F3', '0xFF589994'),
  orange('0xFFFF9E75', '0xFFFFE7DD', '0xFFA16E52'),
  yellow('0xFFFFFF24', '0xFFFFFF9C', '0xFF837C40'),
  violet('0xFFD290EE', '0xFFEBDEF7', '0xFFA862C6'),
  black('0xFF000000', '0xFFF0F0F0', '0xFF757575');

  final String hex;
  final String backgroundHex;
  final String textHex;
  const CategoryColor(this.hex, this.backgroundHex, this.textHex);

  static String returnTagColorfromColorName(String color) {
    final impact = CategoryColor.values.firstWhere(
      (e) => e.name == color,
      orElse: () => CategoryColor.black,
    );

    return impact.hex;
  }

  static String returnBackgroundColorfromColorName(String color) {
    final impact = CategoryColor.values.firstWhere(
      (e) => e.name == color,
      orElse: () => CategoryColor.black,
    );

    return impact.backgroundHex;
  }

  static String returnTextColorfromColorName(String color) {
    final impact = CategoryColor.values.firstWhere(
      (e) => e.name == color,
      orElse: () => CategoryColor.black,
    );

    return impact.textHex;
  }
}

CategoryColor pickUnusedColor(List<CategoryModel> existing) {
  final usedHex = existing.map((e) => e.colorHex).toSet();

  final unused =
      CategoryColor.values.where((c) => !usedHex.contains(c.hex)).toList();

  // 모든 색을 다 썼다면 다시 전체를 사용 가능하게 하는 것이지만 카테고리 수 제한 때문에 일단 주석 처리
  // if (unused.isEmpty) return CategoryColor.values.first;

  unused.shuffle();
  return unused.first;
}
