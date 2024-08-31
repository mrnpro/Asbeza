import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../config/theme-config/color_pallete.dart';

class AppContainer extends HookConsumerWidget {
  const AppContainer(
      {super.key,
      this.child,
      this.color = const Color(0xFF6F6F6F),
      this.gradient,
      this.padding,
      this.margin,
      this.height,
      this.width,
      this.onPressed,
      this.useOpacity = true,
      this.useBorder = false,
      this.radius = 25});

  final double? height;
  final double? width;
  final Widget? child;
  final Color color;
  final Gradient? gradient;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double radius;
  final VoidCallback? onPressed;
  final bool useOpacity;
  final bool useBorder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var radius = BorderRadius.circular(0);
    double getOpacity() {
      return switch (useOpacity) { true => .2, _ => 1 };
    }

    useEffect(() {
      radius = BorderRadius.circular(this.radius);
      return null;
    });
    return Container(
      margin: margin ?? const EdgeInsets.all(16),
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: radius,
          // color: gradient == null ? color ?? const Color(0xFF6F6F6F) : null,
          gradient: gradient,
          border: useBorder
              ? Border.all(
                  color: ColorPallete.kwhite.withOpacity(.6), width: .9)
              : null),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: ColorPallete.kGrey,
          backgroundColor:
              gradient == null ? (color).withOpacity(getOpacity()) : null,
          shape: RoundedRectangleBorder(borderRadius: radius),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 28),
        ),
        onPressed: onPressed,
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
