import 'dart:core';
import 'constants/constants.dart' as constants;
import 'interfaces/interfaces.dart' as interfaces;

class EraDateTime implements interfaces.EraDateTime {
  factory EraDateTime.now({interfaces.Era era = constants.Eras.common}) {
    return EraDateTime.fromDateTime(dateTime: DateTime.now(), era: era);
  }

  factory EraDateTime.fromDateTime({
    required DateTime dateTime,
    interfaces.Era era = constants.Eras.common,
  }) {
    return EraDateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      hour: dateTime.hour,
      minute: dateTime.minute,
      second: dateTime.second,
      millisecond: dateTime.millisecond,
      microsecond: dateTime.microsecond,
      era: era,
    );
  }

  EraDateTime(
    int year,
    int month,
    int day, {
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
    interfaces.Era era = constants.Eras.common,
  }) : _dateTime = DateTime(
         year - era.yearDifference,
         month,
         day,
         hour,
         minute,
         second,
         millisecond,
         microsecond,
       ),
       _era = era;

  final DateTime _dateTime;
  final interfaces.Era _era;

  @override
  DateTime add(Duration duration) => _dateTime.add(duration);

  @override
  int compareTo(DateTime other) => _dateTime.compareTo(other);

  @override
  int get day => _dateTime.day;

  @override
  Duration difference(DateTime other) => _dateTime.difference(other);

  @override
  int get hour => _dateTime.hour;

  @override
  bool isAfter(DateTime other) => _dateTime.isAfter(other);

  @override
  bool isAtSameMomentAs(DateTime other) => _dateTime.isAtSameMomentAs(other);

  @override
  bool isBefore(DateTime other) => _dateTime.isBefore(other);

  @override
  bool get isUtc => _dateTime.isUtc;

  @override
  int get microsecond => _dateTime.microsecond;

  @override
  int get microsecondsSinceEpoch => _dateTime.microsecondsSinceEpoch;

  @override
  int get millisecond => _dateTime.millisecond;

  @override
  int get millisecondsSinceEpoch => _dateTime.millisecondsSinceEpoch;

  @override
  int get minute => _dateTime.minute;

  @override
  int get month => _dateTime.month;

  @override
  int get second => _dateTime.second;

  @override
  DateTime subtract(Duration duration) => _dateTime.subtract(duration);

  @override
  String get timeZoneName => _dateTime.timeZoneName;

  @override
  Duration get timeZoneOffset => _dateTime.timeZoneOffset;

  @override
  String toIso8601String() => _dateTime.toIso8601String();

  @override
  String toString() => _dateTime.toString();

  @override
  DateTime toLocal() => _dateTime.toLocal();

  @override
  DateTime toUtc() => _dateTime.toUtc();

  @override
  int get weekday => _dateTime.weekday;

  @override
  int get year => _dateTime.year;

  @override
  interfaces.Era get era => _era;

  @override
  int get eraYear => _era.yearDifference + _dateTime.year;

  @override
  int yearInEra(interfaces.Era era) => era.yearDifference + _dateTime.year;
}
