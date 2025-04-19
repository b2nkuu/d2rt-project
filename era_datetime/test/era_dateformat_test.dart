import 'package:era_datetime/era_datetime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('EraDateTime to DateFormat', () {
    test('should format date with Common Era correctly', () {
      final commonEraDate = EraDateTime(2023, 5, 15);
      final formatter = DateFormat('yyyy-MM-dd');

      expect(formatter.format(commonEraDate), '2023-05-15');
      expect(commonEraDate.era, Eras.common);
      expect(commonEraDate.eraYear, 2023);
    });

    test('should format date with Buddhist Era correctly', () {
      final buddhistEraDate = EraDateTime(2566, 5, 15, era: Eras.buddhist);
      final formatter = DateFormat('yyyy-MM-dd');

      expect(formatter.format(buddhistEraDate), '2023-05-15');
      expect(buddhistEraDate.era, Eras.buddhist);
      expect(buddhistEraDate.eraYear, 2566);
    });

    test('should format date with different patterns', () {
      final date = EraDateTime(2023, 5, 15, hour: 14, minute: 30);

      expect(DateFormat('yyyy-MM-dd HH:mm').format(date), '2023-05-15 14:30');
      expect(DateFormat('MMM d, yyyy').format(date), 'May 15, 2023');
      expect(
        DateFormat('EEEE, MMMM d, yyyy').format(date),
        'Monday, May 15, 2023',
      );
    });

    test('should handle different eras with the same date', () {
      final commonDate = EraDateTime(2023, 1, 1);
      final buddhistDate = EraDateTime(2566, 1, 1, era: Eras.buddhist);

      final formatter = DateFormat('yyyy-MM-dd');

      expect(formatter.format(commonDate), formatter.format(buddhistDate));
      expect(commonDate.eraYear, 2023);
      expect(buddhistDate.eraYear, 2566);
    });
  });

  group('EraDateTime to DateFormat with eraFormat', () {
    test('All foramat of year should be replaced with era year', () {
      final commonEraDate = EraDateTime(2023, 5, 15);
      final buddhistEraDate = EraDateTime(2566, 5, 15, era: Eras.buddhist);

      final formatter = DateFormat('yyyy');
      expect(formatter.eraFormat(commonEraDate), '2023');
      expect(formatter.eraFormat(buddhistEraDate), '2566');
      expect(
        formatter.eraFormat(commonEraDate, formatEra: Eras.buddhist),
        '2566',
      );

      final formatter2 = DateFormat('yyy');
      expect(formatter2.eraFormat(commonEraDate), '2023');
      expect(formatter2.eraFormat(buddhistEraDate), '2566');
      expect(
        formatter2.eraFormat(commonEraDate, formatEra: Eras.buddhist),
        '2566',
      );

      final formatter3 = DateFormat('yy');
      expect(formatter3.eraFormat(commonEraDate), '23');
      expect(formatter3.eraFormat(buddhistEraDate), '66');
      expect(
        formatter3.eraFormat(commonEraDate, formatEra: Eras.buddhist),
        '66',
      );

      final formatter4 = DateFormat('y');
      expect(formatter4.eraFormat(commonEraDate), '2023');
      expect(formatter4.eraFormat(buddhistEraDate), '2566');
      expect(
        formatter4.eraFormat(commonEraDate, formatEra: Eras.buddhist),
        '2566',
      );

      final formatter5 = DateFormat('yyyyy');
      expect(formatter5.eraFormat(commonEraDate), '02023');
      expect(formatter5.eraFormat(buddhistEraDate), '02566');
      expect(
        formatter5.eraFormat(commonEraDate, formatEra: Eras.buddhist),
        '02566',
      );

      final formatter6 = DateFormat('yyyyyy');
      expect(formatter6.eraFormat(commonEraDate), '002023');
      expect(formatter6.eraFormat(buddhistEraDate), '002566');
      expect(
        formatter6.eraFormat(commonEraDate, formatEra: Eras.buddhist),
        '002566',
      );

      // Test with combined date formats
      final formatterCombined1 = DateFormat('yyyy-MM-dd');
      expect(formatterCombined1.eraFormat(commonEraDate), '2023-05-15');
      expect(formatterCombined1.eraFormat(buddhistEraDate), '2566-05-15');
      expect(
        formatterCombined1.eraFormat(commonEraDate, formatEra: Eras.buddhist),
        '2566-05-15',
      );

      final formatterCombined2 = DateFormat('MMMM d, yyyy');
      expect(formatterCombined2.eraFormat(commonEraDate), 'May 15, 2023');
      expect(formatterCombined2.eraFormat(buddhistEraDate), 'May 15, 2566');
      expect(
        formatterCombined2.eraFormat(commonEraDate, formatEra: Eras.buddhist),
        'May 15, 2566',
      );

      final formatterCombined3 = DateFormat('EEEE, MMMM d, yyyy');
      expect(
        formatterCombined3.eraFormat(commonEraDate),
        'Monday, May 15, 2023',
      );
      expect(
        formatterCombined3.eraFormat(buddhistEraDate),
        'Monday, May 15, 2566',
      );
      expect(
        formatterCombined3.eraFormat(commonEraDate, formatEra: Eras.buddhist),
        'Monday, May 15, 2566',
      );

      // Test with time formats
      final dateWithTime = EraDateTime(
        2023,
        5,
        15,
        hour: 14,
        minute: 30,
        second: 45,
      );
      final buddhistDateWithTime = EraDateTime(
        2566,
        5,
        15,
        hour: 14,
        minute: 30,
        second: 45,
        era: Eras.buddhist,
      );

      final formatterWithTime1 = DateFormat('yyyy-MM-dd HH:mm:ss');
      expect(formatterWithTime1.eraFormat(dateWithTime), '2023-05-15 14:30:45');
      expect(
        formatterWithTime1.eraFormat(buddhistDateWithTime),
        '2566-05-15 14:30:45',
      );

      final formatterWithTime2 = DateFormat('yyyy-MM-dd h:mm a');
      expect(formatterWithTime2.eraFormat(dateWithTime), '2023-05-15 2:30 PM');
      expect(
        formatterWithTime2.eraFormat(buddhistDateWithTime),
        '2566-05-15 2:30 PM',
      );

      // Test with predefined formats
      final formatterPredefined1 = DateFormat.yMd();
      expect(formatterPredefined1.eraFormat(commonEraDate), '5/15/2023');
      expect(formatterPredefined1.eraFormat(buddhistEraDate), '5/15/2566');

      final formatterPredefined2 = DateFormat.yMMMMd();
      expect(formatterPredefined2.eraFormat(commonEraDate), 'May 15, 2023');
      expect(formatterPredefined2.eraFormat(buddhistEraDate), 'May 15, 2566');
    });
  });
}
