import 'unit.dart';
import 'unit_localization.dart';

typedef UnitLocalization = Map<String, String>;
RegExp _zeroRemoverRegex = RegExp(r'([.]*0)(?!.*\d)');

class Measurement<T extends Unit> {
  Measurement({
    required this.value,
    required this.unit,
  });

  final num value;
  final T unit;
  static UnitLocalization locale = UnitLocale.en;

  @override
  String toString() {
    return '${value.toString().replaceAll(_zeroRemoverRegex, '')} '
        '${locale[unit.localeKey]}';
  }
}
