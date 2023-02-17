abstract class Unit {
  const Unit({
    required this.from,
    required this.to,
    required this.localeKey,
  });

  final double from;
  final double to;
  final String localeKey;
}
