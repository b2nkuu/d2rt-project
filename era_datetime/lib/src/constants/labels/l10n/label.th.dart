part of '../labels.dart';

class _LabelTH implements interfaces.EraLabel {
  @override
  String name(constants.Eras era) => switch (era) {
    constants.Eras.common => 'สากลศักราช',
    constants.Eras.christian => 'คริสต์ศักราช',
    constants.Eras.buddhist => 'พุทธศักราช',
    constants.Eras.rattanakosin => 'รัตนโกสินทร์ศก',
  };

  @override
  String initial(constants.Eras era) => switch (era) {
    constants.Eras.common => 'ส.ศ.',
    constants.Eras.christian => 'ค.ศ.',
    constants.Eras.buddhist => 'พ.ศ.',
    constants.Eras.rattanakosin => 'ร.ศ.',
  };

  @override
  String monogram(constants.Eras era) => switch (era) {
    constants.Eras.common => 'สศ',
    constants.Eras.christian => 'คศ',
    constants.Eras.buddhist => 'พศ',
    constants.Eras.rattanakosin => 'รศ',
  };
}
