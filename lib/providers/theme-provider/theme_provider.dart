import 'package:asbeza/core/config/theme-config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/enum/theme_config_enum.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeProvider extends _$ThemeProvider {
  late ThemeConfig _themeConfig;
  @override
  ThemeData build() {
    _themeConfig = ref.watch(themeConfigProvider);
    return _themeConfig.fruitTheme;
  }

  void changeTheme(ThemeConfigEnum theme) {
    final upcomingTheme = switch (theme) {
      ThemeConfigEnum.fruitTheme => _themeConfig.fruitTheme,
      ThemeConfigEnum.vegtableTheme => _themeConfig.vegetebleTheme
    };
    state = upcomingTheme;
  }

  ThemeConfigEnum currentTheme() {
    if (state == _themeConfig.fruitTheme) {
      return ThemeConfigEnum.fruitTheme;
    } else {
      return ThemeConfigEnum.vegtableTheme;
    }
  }
}
