part of 'constants.dart';

/// [Eras] represents different calendar systems used for date calculations.
enum Eras implements Era {
  /// Common Era (CE) - The standard era used in the Gregorian calendar system,
  /// counting years from the traditional birth of Jesus Christ.
  common,

  /// Anno Domini (AD) - Christian era dating system, equivalent to Common Era
  /// but with religious connotation, counting years from the birth of Christ.
  christian,

  /// Buddhist Era (BE) - Calendar system used in Southeast Asian countries like
  /// Thailand, Cambodia, and Laos, which is 543 years before the Gregorian calendar.
  buddhist,

  /// Rattanakosin Era (RE) - The era used in Thailand, counting years from the
  /// establishment of the Rattanakosin Dynasty is 1781 years after the Gregorian calendar.
  rattanakosin;

  @override
  String get initial => EraLabels().initial(this);

  @override
  String get monogram => EraLabels().monogram(this);

  @override
  String get name => EraLabels().name(this);

  @override
  int get yearDifference => switch (this) {
    Eras.common => 0,
    Eras.christian => 0,
    Eras.buddhist => 543,
    Eras.rattanakosin => -1781,
  };
}
