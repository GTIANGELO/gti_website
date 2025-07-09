import 'package:flutter/material.dart';
import 'package:gti_website/functions/responsive_utils.dart';

class UtilityFunctions {
  Map<String, Color> getThemeColors(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    return {
      'primary': const Color(0xFFFF640E),
      'secondary': const Color(0xFF2D66AD),
      'tertiary': const Color(0xFFFFFFFF),
      'warning': const Color(0xFFF0AD4E),
      'danger': const Color(0xFFD9534F),
    };
  }
}

extension ScreenSizeHelper on ScreenSize {
  T value<T>(T small, T medium, T large, [T? extraLarge]) {
    if (isSmall) return small;
    if (isMedium) return medium;
    if (isLarge) return large;
    return extraLarge ?? large;
  }
}
