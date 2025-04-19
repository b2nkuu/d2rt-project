part of '../labels.dart';

class _LabelEN implements interfaces.EraLabel {
  @override
  String name(constants.Eras era) => switch (era) {
    constants.Eras.common => 'Common Era',
    constants.Eras.christian => 'Christian Era',
    constants.Eras.buddhist => 'Buddhist Era',
    constants.Eras.rattanakosin => 'Rattanakosin Era',
  };

  @override
  String initial(constants.Eras era) => switch (era) {
    constants.Eras.common => 'C.E.',
    constants.Eras.christian => 'C.E.',
    constants.Eras.buddhist => 'B.E.',
    constants.Eras.rattanakosin => 'R.E.',
  };

  @override
  String monogram(constants.Eras era) => switch (era) {
    constants.Eras.common => 'CE',
    constants.Eras.christian => 'CE',
    constants.Eras.buddhist => 'BE',
    constants.Eras.rattanakosin => 'RE',
  };
}
