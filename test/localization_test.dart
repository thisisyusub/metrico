import 'package:flutter_test/flutter_test.dart';
import 'package:metrico/metrico.dart';
import 'package:metrico/src/unit_localization.dart';

void main() {
  test(
    'measurement should return translated suffix',
    () {
      final measurement = Measurement(
        value: 12,
        unit: UnitLength.kilometers,
      );

      expect(measurement.toString(), '12 kilometers');

      Measurement.locale = UnitLocale.az;
      expect(measurement.toString(), '12 kilometr');
    },
  );
}
