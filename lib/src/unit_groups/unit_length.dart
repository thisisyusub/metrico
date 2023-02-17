import '../measurement.dart';
import '../unit.dart';

abstract class UnitLength {
  static const kilometers = Length.kilometers();
  static const meters = Length.meters();
  static const millimeters = Length.millimeters();
}

extension UnitLengthConversionExt on Measurement<Length> {
  Measurement convert({required Length to}) {
    final currentUnit = unit.from;
    final convertingUnit = to.to;

    return Measurement(
      value: value * currentUnit * convertingUnit,
      unit: to,
    );
  }
}

class Length extends Unit {
  const Length({
    required super.from,
    required super.to,
    required super.localeKey,
  });

  const Length.kilometers()
      : this(
          from: 1000,
          to: 0.001,
          localeKey: 'kilometers',
        );

  const Length.meters()
      : this(
          from: 1,
          to: 1,
          localeKey: 'meters',
        );

  const Length.millimeters()
      : this(
          from: 0.001,
          to: 1000,
          localeKey: 'millimeters',
        );
}
