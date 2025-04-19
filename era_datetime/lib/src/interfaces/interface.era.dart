part of 'interfaces.dart';

/// [Era] is a interface that represents a calendar system with chronology system.
abstract interface class Era {
  /// [yearDifference] is the difference in years between the current era and the common era.
  int get yearDifference;

  /// [name] is the name of the era.
  String get name;

  /// [initial] is the initial of the era.
  String get initial;

  /// [monogram] is the monogram of the era.
  String get monogram;
}
