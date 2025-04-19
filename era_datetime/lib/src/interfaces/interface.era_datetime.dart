part of 'interfaces.dart';

/// [EraDateTime] is a interface that represents a base class for datetime with chronology system.
abstract interface class EraDateTime implements DateTime {
  /// [era] is the era of the datetime is specific.
  Era get era;

  /// [year] is the year of the datetime in the specific era.
  int get eraYear;

  /// [yearInEra] is the year of the datetime in the parameter era.
  int yearInEra(Era era);
}
