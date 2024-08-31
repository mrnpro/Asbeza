import 'package:flutter/material.dart';

import '../../../main.dart';
import '../index.dart';

class ColorPallete {
  ColorPallete._();
  static const kGrey = Color(0xFF848484);
  static const kwhite = Colors.white;
  static final fruitGradient = [
    const Color(0XFFFBC01C).withOpacity(.20),
    const Color(0xFF6B8553).withOpacity(.20),
    const Color(0xFF595959).withOpacity(.20)
  ];
  static final vegetableGradient = [
    const Color(0XFF9BFF43).withOpacity(.20),
    const Color(0xFF688553).withOpacity(.20),
    const Color(0xFF595959).withOpacity(.20),
  ];
  static List<Color> getThemeGradientColors(BuildContext context) {
    final themeConfig = container.read(themeConfigProvider);
    final fruitTheme = themeConfig.fruitTheme;
    final vegetableTheme = themeConfig.vegetebleTheme;
    final theme = Theme.of(context);
    if (theme.primaryColor == fruitTheme.primaryColor) {
      return fruitGradient;
    } else if (theme.primaryColor == vegetableTheme.primaryColor) {
      return vegetableGradient;
    }
    return [];
  }
}
