import '../measurement.dart';
import '../unit.dart';

abstract class UnitInformationStorage {
  static const bits = InformationStorage.bits();
  static const bytes = InformationStorage.bytes();
  static const kilobytes = InformationStorage.kilobytes();
  static const megabytes = InformationStorage.megabytes();
}

extension UnitLengthConversionExt on Measurement<InformationStorage> {
  Measurement convert({required InformationStorage to}) {
    final currentUnit = unit.from;
    final convertingUnit = to.to;

    return Measurement(
      value: value * currentUnit * convertingUnit,
      unit: to,
    );
  }
}

class InformationStorage extends Unit {
  const InformationStorage({
    required super.from,
    required super.to,
    required super.localeKey,
  });

  const InformationStorage.bits()
      : this(
          from: 1 / (1024 * 8),
          to: 1024 * 8,
          localeKey: 'bits',
        );

  const InformationStorage.bytes()
      : this(
          from: 1 / 1024,
          to: 1024,
          localeKey: 'bytes',
        );

  const InformationStorage.kilobytes()
      : this(
          from: 1,
          to: 1,
          localeKey: 'kilobytes',
        );

  const InformationStorage.megabytes()
      : this(
          from: 1024,
          to: 0.0009765625,
          localeKey: 'megabytes',
        );
}
