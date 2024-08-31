import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GlassmorphicContainer extends StatelessWidget {
  final AlignmentGeometry? alignment;

  final EdgeInsetsGeometry? padding;

  final double width;
  final double height;

  final EdgeInsetsGeometry? margin;

  final Matrix4? transform;

  final Widget? child;

  final double borderRadius;
  final BoxShape shape;
  final BoxConstraints? constraints;

  final double border;
  final double blur;
  final LinearGradient? linearGradient;
  final LinearGradient? borderGradient;
  final Color? color;
  GlassmorphicContainer(
      {super.key,
      this.child,
      this.alignment,
      this.padding,
      this.shape = BoxShape.rectangle,
      BoxConstraints? constraints,
      this.margin,
      this.transform,
      required this.width,
      required this.height,
      required this.borderRadius,
      this.linearGradient,
      required this.border,
      required this.blur,
      this.borderGradient,
      this.color})
      : assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(constraints == null || constraints.debugAssertIsValid()),
        constraints = constraints?.tighten(width: width, height: height) ??
            BoxConstraints.tightFor(width: width, height: height);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AlignmentGeometry>(
        'alignment', alignment,
        showName: false, defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding,
        defaultValue: null));
    properties.add(DiagnosticsProperty<BoxConstraints>(
        'constraints', constraints,
        defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin,
        defaultValue: null));
    properties.add(ObjectFlagProperty<Matrix4>.has('transform', transform));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        color: color ?? const Color(0xFF787878).withOpacity(.10),
        key: key,
        width: width,
        margin: margin,
        alignment: alignment,
        constraints: constraints,
        height: height,
        transform: transform,
        child: Stack(
          alignment: alignment ?? Alignment.topLeft,
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(borderRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur * 2),
                child: Container(
                  alignment: alignment ?? Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    gradient: linearGradient,
                  ),
                ),
              ),
            ),
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                alignment: alignment,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
