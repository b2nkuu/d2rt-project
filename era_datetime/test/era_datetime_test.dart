import 'package:era_datetime/era_datetime.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EraDateTime', () {
    test('should return the correct era year', () {
      const commonEraYear = 2021;
      const buddhistEraYear = 2564;

      final eraDateTime = EraDateTime(commonEraYear, 1, 1);
      expect(eraDateTime.year, commonEraYear);
      expect(eraDateTime.eraYear, commonEraYear);
      expect(eraDateTime.era, Eras.common);

      final buddhistEraDateTime = EraDateTime(
        buddhistEraYear,
        1,
        1,
        era: Eras.buddhist,
      );
      expect(buddhistEraDateTime.year, commonEraYear);
      expect(buddhistEraDateTime.eraYear, buddhistEraYear);
      expect(buddhistEraDateTime.era, Eras.buddhist);
    });

    test('should handle all properties correctly', () {
      final dateTime = EraDateTime(
        2023,
        5,
        15,
        hour: 10,
        minute: 30,
        second: 45,
        millisecond: 500,
        microsecond: 600,
        era: Eras.buddhist,
      );

      expect(dateTime.year, 1480); // 2023 - 543 (Buddhist era difference)
      expect(dateTime.eraYear, 2023);
      expect(dateTime.month, 5);
      expect(dateTime.day, 15);
      expect(dateTime.hour, 10);
      expect(dateTime.minute, 30);
      expect(dateTime.second, 45);
      expect(dateTime.millisecond, 500);
      expect(dateTime.microsecond, 600);
      expect(dateTime.era, Eras.buddhist);
      expect(dateTime.era.name, 'Buddhist Era');
      expect(dateTime.era.initial, 'B.E.');
      expect(dateTime.era.monogram, 'BE');
      expect(dateTime.era.yearDifference, 543);
    });

    test('should handle DateTime methods correctly', () {
      final dateTime = EraDateTime(2023, 5, 15);

      // Test add and subtract
      final added = dateTime.add(const Duration(days: 5));
      expect(added.day, 20);
      expect(added.month, 5);
      expect(added.year, 2023);

      final subtracted = dateTime.subtract(const Duration(days: 5));
      expect(subtracted.day, 10);
      expect(subtracted.month, 5);
      expect(subtracted.year, 2023);

      // Test comparison methods
      final earlier = EraDateTime(2022, 12, 31);
      final later = EraDateTime(2023, 6, 1);
      final same = EraDateTime(2023, 5, 15);

      expect(dateTime.isAfter(earlier), true);
      expect(dateTime.isBefore(later), true);
      expect(dateTime.isAtSameMomentAs(same), true);
      expect(dateTime.compareTo(earlier), greaterThan(0));
      expect(dateTime.compareTo(later), lessThan(0));
      expect(dateTime.compareTo(same), equals(0));

      // Test difference
      final diff = dateTime.difference(earlier);
      expect(diff.inDays, 135); // From Dec 31 to May 15

      // Test timezone properties
      expect(dateTime.isUtc, false);
      expect(dateTime.timeZoneName, isNotEmpty);
      expect(dateTime.timeZoneOffset, isNotNull);

      // Test string conversion
      expect(dateTime.toIso8601String(), contains('2023-05-15T'));
      expect(dateTime.toString(), contains('2023-05-15'));
    });

    test('should handle different eras correctly', () {
      // Test Common Era (CE/AD)
      final commonEra = EraDateTime(2025, 1, 1);
      expect(commonEra.year, 2025);
      expect(commonEra.eraYear, 2025);

      // Test Buddhist Era (BE)
      final buddhistEra = EraDateTime(2568, 1, 1, era: Eras.buddhist);
      expect(buddhistEra.year, 2025);
      expect(buddhistEra.eraYear, 2568);

      // Test Rattanakosin Era (R.E.)
      final rattanakosinEra = EraDateTime(244, 1, 1, era: Eras.rattanakosin);
      expect(rattanakosinEra.year, 2025);
      expect(rattanakosinEra.eraYear, 244);

      // Verify both represent the same date
      expect(commonEra.isAtSameMomentAs(buddhistEra), true);
      expect(commonEra.difference(buddhistEra).inSeconds, 0);
    });

    test('should handle UTC conversion correctly', () {
      final localDateTime = EraDateTime(2023, 5, 15);
      final utcDateTime = localDateTime.toUtc();

      expect(utcDateTime.isUtc, true);
      expect(localDateTime.isUtc, false);
      expect(utcDateTime.isAtSameMomentAs(localDateTime), true);

      final localAgain = utcDateTime.toLocal();
      expect(localAgain.isUtc, false);
      expect(localAgain.isAtSameMomentAs(utcDateTime), true);
    });

    test('should handle fromDateTime correctly', () {
      final dateTime = DateTime(2023, 5, 15);
      final eraDateTime = EraDateTime.fromDateTime(
        dateTime: dateTime,
        era: Eras.buddhist,
      );
      expect(eraDateTime.year, 2023);
      expect(eraDateTime.eraYear, 2566);
      expect(eraDateTime.era, Eras.buddhist);
    });
  });
}
