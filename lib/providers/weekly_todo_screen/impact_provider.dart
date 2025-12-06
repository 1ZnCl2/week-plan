import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ImpactSelection {
  none(0, '0xFF757575'),
  low(1, '0xFF77C979'),
  medium(2, '0xFFFFE342'),
  high(3, '0xFFD24D4D');

  final int value;
  final String colorHex;

  const ImpactSelection(this.value, this.colorHex);

  static ImpactSelection fromValue(int v) {
    return ImpactSelection.values.firstWhere(
      (e) => e.value == v,
      orElse: () => ImpactSelection.none,
    );
  }

  static String returnColorHex(int v) {
    final impact = ImpactSelection.values.firstWhere(
      (e) => e.value == v,
      orElse: () => ImpactSelection.none,
    );

    return impact.colorHex;
  }
}

extension ImpactRotation on ImpactSelection {
  ImpactSelection next() {
    final list = ImpactSelection.values;
    final index = list.indexOf(this);
    final nextIndex = (index + 1) % list.length;
    return list[nextIndex];
  }
}

final impactProvider =
    StateProvider<ImpactSelection>((ref) => ImpactSelection.none);
