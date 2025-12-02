import 'package:week_plan/models/comprehensive_model/comprehensive_model.dart';

Map<DateTime, List<ComprehensiveModel>> groupByDate(
    List<ComprehensiveModel> list) {
  final Map<DateTime, List<ComprehensiveModel>> result = {};

  for (final item in list) {
    final key = DateTime(item.date.year, item.date.month, item.date.day);

    if (!result.containsKey(key)) {
      result[key] = [];
    }
    result[key]!.add(item);
  }

  return result;
}
