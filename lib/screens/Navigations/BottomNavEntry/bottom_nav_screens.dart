import 'package:asbeza/screens/Navigations/BottomNavEntry/BottomNavElements/bottom_nav_elements.dart';
import 'package:asbeza/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavScreens extends ConsumerStatefulWidget {
  const BottomNavScreens({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomNavScreensState();
}

class _BottomNavScreensState extends ConsumerState<BottomNavScreens> {
  @override
  Widget build(BuildContext context) {
    ref.watch(bottomNavElementsNotifierProvider);
    final index =
        ref.watch(bottomNavElementsNotifierProvider.notifier).selectedIndex();
    return switch (index) {
      0 => const HomeScreen(),
      1 => const OrdersScreen(),
      _ => const Center(
          child: Text("Error: Page Not found"),
        )
    };
  }
}
