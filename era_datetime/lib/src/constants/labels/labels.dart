import 'package:intl/intl.dart';

import '../../constants/constants.dart' as constants;
import '../../interfaces/interfaces.dart' as interfaces;

part 'l10n/label.en.dart';
part 'l10n/label.th.dart';

class EraLabels implements interfaces.EraLabel {
  EraLabels._(this.labels);

  factory EraLabels() {
    return switch (Intl.getCurrentLocale()) {
      final String locale when locale.startsWith('th') => EraLabels._(
        _LabelTH(),
      ),
      _ => EraLabels._(_LabelEN()),
    };
  }

  final interfaces.EraLabel labels;

  @override
  String name(constants.Eras era) => labels.name(era);

  @override
  String initial(constants.Eras era) => labels.initial(era);

  @override
  String monogram(constants.Eras era) => labels.monogram(era);
}
