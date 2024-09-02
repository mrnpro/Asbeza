import 'package:asbeza/screens/Navigations/BottomNavEntry/BottomNavElements/bottom_nav_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/components/index.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavElements = ref.watch(bottomNavElementsNotifierProvider);
    final primaryColor = Theme.of(context).primaryColor;
    return GlassmorphicContainer(
      height: 70.h,
      width: 400.w,
      blur: 50,
      color: const Color(0xFF6F6F6F),
      alignment: Alignment.bottomCenter,
      border: 2,
      borderRadius: 27,
      borderGradient: null,
      linearGradient: null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomNavElements.length, (index) {
            final bottomElement = bottomNavElements.elementAt(index);
            final color = bottomElement.isActive ? primaryColor : null;
            return Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  select(index, ref);
                },
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              if (bottomElement.isActive)
                                BoxShadow(
                                    color: primaryColor.withOpacity(.5),
                                    blurRadius: 20,
                                    spreadRadius: 8,
                                    blurStyle: BlurStyle.normal)
                            ]),
                      ),
                    ),
                    SvgPicture.asset(
                      bottomElement.icon,
                      color: color,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void select(int index, WidgetRef ref) {
    ref.read(bottomNavElementsNotifierProvider.notifier).selectElement(index);
  }
}
