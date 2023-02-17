import 'package:flutter_test/flutter_test.dart';
import 'package:metrico/src/measurement.dart';
import 'package:metrico/src/unit_groups/unit_information_storage.dart';

void main() {
  group(
    'conversion tests of unit information storage:',
    () {
      buildConversionTest(
        title: 'bits -> bytes',
        from: UnitInformationStorage.bits,
        to: UnitInformationStorage.bytes,
        expected: '0.125 bytes',
      );

      buildConversionTest(
        title: 'bits -> kilobytes',
        from: UnitInformationStorage.bits,
        to: UnitInformationStorage.kilobytes,
        expected: '0.0001220703125 kilobytes',
      );

      buildConversionTest(
        title: 'bits -> megabytes',
        from: UnitInformationStorage.bits,
        to: UnitInformationStorage.megabytes,
        expected: '1.1920928955078125e-7 megabytes',
      );

      buildConversionTest(
        title: 'kilobytes -> megabytes',
        from: UnitInformationStorage.kilobytes,
        to: UnitInformationStorage.megabytes,
        expected: '0.0009765625 megabytes',
      );

      buildConversionTest(
        title: 'megabytes -> kilobytes',
        from: UnitInformationStorage.megabytes,
        to: UnitInformationStorage.kilobytes,
        expected: '1024 kilobytes',
      );
    },
  );
}

void buildConversionTest({
  required String title,
  required InformationStorage from,
  required InformationStorage to,
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
