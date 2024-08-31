import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/config/index.dart';
import 'screens/screens.dart';

class App extends HookConsumerWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(themeProviderProvider);
    return MaterialApp(
        title: 'Asbeza APP', theme: theme, home: const EntryScreen());
  }
}
