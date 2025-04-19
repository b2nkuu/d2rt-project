import 'dart:core';
import 'package:intl/intl.dart';

import 'interfaces/interfaces.dart' as interfaces;

extension EraDateFormat on DateFormat {
  String eraFormat(
    interfaces.EraDateTime dateTime, {
    interfaces.Era? formatEra,
  }) {
    // if pattern is null, throw format error not found
    if (pattern case final String pattern) {
      // [patternGroup] is list of group of characters not same
      // for example: 'yyyy-MM-dd' -> ['yyyy', '-', 'MM', '-', 'dd']
      final patternGroup = <String>[];

      // group pattern by same character
      for (var char in pattern.split('')) {
        if (patternGroup.isEmpty) {
          patternGroup.add(char);
        } else {
          if (patternGroup.last.lastIndexOf(char) == -1) {
            patternGroup.add(char);
          } else {
            patternGroup.last += char;
          }
        }
      }

      // [formattedDate] is list of formatted date by each group
      final formattedDate = <String>[];

      // format each group to formattedDate
      for (var pattern in patternGroup) {
        // create formatter for each group
        final formatter = DateFormat(pattern, locale);

        if (pattern.contains('y')) {
          formattedDate.add(
            _yearFormat(pattern, formatter, dateTime, formatEra),
          );
        } else if (pattern.contains('G')) {
          formattedDate.add(
            _eraFormat(pattern, formatter, dateTime, formatEra),
          );
        } else {
          formattedDate.add(formatter.format(dateTime));
        }
      }

      // join formatted date
      return formattedDate.join();
    } else {
      throw const FormatException('pattern not found in format');
    }
  }

  // check if pattern is year
  // if true, format with era year
  // if false, format with date time
  String _yearFormat(
    String pattern,
    DateFormat formatter,
    interfaces.EraDateTime dateTime,
    interfaces.Era? formatEra,
  ) {
    return formatter.format(
      dateTime.copyWith(
        year:
            formatEra != null
                ? dateTime.yearInEra(formatEra)
                : dateTime.eraYear,
        month: 1,
        day: 1,
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
        isUtc: true,
      ),
    );
  }

  String _eraFormat(
    String pattern,
    DateFormat formatter,
    interfaces.EraDateTime dateTime,
    interfaces.Era? formatEra,
  ) {
    if (pattern.length >= 4) {
      return formatEra?.name ?? dateTime.era.name;
    } else if (pattern.length >= 2) {
      return formatEra?.initial ?? dateTime.era.initial;
    } else {
      return formatEra?.monogram ?? dateTime.era.monogram;
    }
  }
}
