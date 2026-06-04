import 'package:flutter_test/flutter_test.dart';
import 'package:week_plan/service/calendar_layout_service.dart';

void main() {
  const layout = CalendarLayoutService();

  group('CalendarLayoutService', () {
    test('converts the first day column to Monday', () {
      final weekBase = DateTime(2026, 6, 1);

      final date = layout.dateFromOffset(
        weekBase,
        const Offset(CalendarLayoutService.timeColumnWidth, 0),
      );

      expect(date, DateTime(2026, 6, 1));
    });

    test('converts an offset to the expected weekday and time', () {
      final weekBase = DateTime(2026, 6, 1);

      final date = layout.dateFromOffset(
        weekBase,
        const Offset(
          CalendarLayoutService.timeColumnWidth +
              CalendarLayoutService.dayColumnWidth * 2,
          CalendarLayoutService.hourRowHeight * 13.5,
        ),
      );

      expect(date, DateTime(2026, 6, 3, 13, 30));
    });

    test('keeps week date math valid across month boundaries', () {
      final weekBase = DateTime(2026, 1, 26);

      final date = layout.dateFromOffset(
        weekBase,
        const Offset(
          CalendarLayoutService.timeColumnWidth +
              CalendarLayoutService.dayColumnWidth * 6,
          0,
        ),
      );

      expect(date, DateTime(2026, 2, 1));
    });

    test('accounts for the timeline column before day columns', () {
      expect(layout.weekdayFromDx(0), 1);
      expect(layout.weekdayFromDx(CalendarLayoutService.timeColumnWidth), 1);
      expect(
        layout.weekdayFromDx(
          CalendarLayoutService.timeColumnWidth +
              CalendarLayoutService.dayColumnWidth,
        ),
        2,
      );
    });

    test('converts date time back to the tile offset', () {
      final offset = layout.offsetFromDateTime(DateTime(2026, 6, 4, 9, 30));

      expect(
        offset.dx,
        CalendarLayoutService.timeColumnWidth +
            CalendarLayoutService.dayColumnWidth * 3,
      );
      expect(offset.dy, CalendarLayoutService.hourRowHeight * 9.5);
    });

    test('converts duration to height with a minimum tile height', () {
      expect(
        layout.heightFromDuration(
          DateTime(2026, 6, 1, 9),
          DateTime(2026, 6, 1, 10),
        ),
        CalendarLayoutService.hourRowHeight,
      );
      expect(
        layout.heightFromDuration(
          DateTime(2026, 6, 1, 9),
          DateTime(2026, 6, 1, 9, 5),
        ),
        CalendarLayoutService.minScheduleTileHeight,
      );
    });
  });
}
