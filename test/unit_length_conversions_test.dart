import 'package:flutter_test/flutter_test.dart';
import 'package:metrico/src/measurement.dart';
import 'package:metrico/src/unit_groups/unit_length.dart';

void main() {
  group(
    'conversion tests of unit length:',
    () {
      buildConversionTest(
        title: 'kilometres -> metres',
        from: UnitLength.kilometers,
        to: UnitLength.meters,
        expected: '1000 meters',
      );

      buildConversionTest(
        title: 'kilometres -> millimeters',
        from: UnitLength.kilometers,
        to: UnitLength.millimeters,
        expected: '1000000 millimeters',
      );

      buildConversionTest(
        title: 'meters -> kilometers',
        from: UnitLength.meters,
        to: UnitLength.kilometers,
        expected: '0.001 kilometers',
      );

      buildConversionTest(
        title: 'meters -> millimeters',
        from: UnitLength.meters,
        to: UnitLength.millimeters,
        expected: '1000 millimeters',
      );

      buildConversionTest(
        title: 'millimeters -> meters',
        from: UnitLength.millimeters,
        to: UnitLength.meters,
        expected: '0.001 meters',
      );

      buildConversionTest(
        title: 'millimeters -> kilometers',
        from: UnitLength.millimeters,
        to: UnitLength.kilometers,
        expected: '0.000001 kilometers',
      );
    },
  );
}

void buildConversionTest({
  required String title,
  required Length from,
  required Length to,
  required String expected,
}) {
  test(
    title,
    () {
      final value = Measurement(value: 1, unit: from);
      final convertedValue = value.convert(to: to);
      expect(convertedValue.toString(), expected);
    },
  );
}
