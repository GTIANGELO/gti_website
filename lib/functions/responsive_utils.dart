class ScreenSize {
  final bool isSmall;
  final bool isMedium;
  final bool isLarge;

  ScreenSize(
      {required this.isSmall, required this.isMedium, required this.isLarge});
}

ScreenSize getScreenSize(double width) {
  final isSmall = width < 600;
  final isMedium = width >= 600 && width < 1024;
  final isLarge = width >= 1024;

  return ScreenSize(isSmall: isSmall, isMedium: isMedium, isLarge: isLarge);
}
