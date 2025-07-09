class ScreenSize {
  final bool isSmall;
  final bool isMedium;
  final bool isLarge;
  final bool isExtraLarge;

  ScreenSize({
    required this.isSmall,
    required this.isMedium,
    required this.isLarge,
    required this.isExtraLarge,
  });
}

ScreenSize getScreenSize(double width) {
  return ScreenSize(
    isSmall: width < 600,
    isMedium: width >= 600 && width < 900,
    isLarge: width >= 900 && width < 1440,
    isExtraLarge: width >= 1440,
  );
}
