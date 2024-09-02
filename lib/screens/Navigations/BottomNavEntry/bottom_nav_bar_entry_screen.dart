import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bottom_nav_bar.dart';
import '../../../core/components/index.dart';
import 'bottom_nav_screens.dart';

final togleEclipseProvider = StateProvider<bool>((ref) {
  return false;
});

class EntryScreen extends StatefulHookConsumerWidget {
  const EntryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EntryScreenState();
}

class _EntryScreenState extends ConsumerState<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    final hideEclipse = ref.watch(togleEclipseProvider);
    return Stack(
      children: [
        AppBackground(
            hideEllipse: hideEclipse, child: const BottomNavScreens()),
        Positioned(
          bottom: 30.h,
          left: 40.w,
          right: 40.w,
          child: const BottomNavBar(),
        )
      ],
    );
  }
}
