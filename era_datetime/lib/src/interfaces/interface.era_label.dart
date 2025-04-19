part of 'interfaces.dart';

/// [EraLabel] is a interface that represents a label of the era.
abstract interface class EraLabel {
  /// [name] is the name of the era. is date pattern is [G].
  String name(constants.Eras era);

  /// [initial] is the initial of the era. is date pattern is [GG].
  String initial(constants.Eras era);

  /// [monogram] is the monogram of the era. is date pattern is [GGGG].
  String monogram(constants.Eras era);
}
