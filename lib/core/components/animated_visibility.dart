import 'package:flutter/material.dart';

class AnimateVisibility extends StatefulWidget {
  final bool isVisible;
  final Widget child;
  final Duration duration;
  final Curve curve;

  const AnimateVisibility({
    super.key,
    required this.isVisible,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  @override
  createState() => _AnimateVisibilityState();
}

class _AnimateVisibilityState extends State<AnimateVisibility>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: widget.duration,
      curve: widget.curve,
      child: AnimatedOpacity(
        opacity: widget.isVisible ? 1.0 : 0.0,
        duration: widget.duration,
        curve: widget.curve,
        child: Visibility(
          visible: widget.isVisible,
          child: widget.child,
        ),
      ),
    );
  }
}
