import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'glass_container_widget.dart';

class AppBackground extends HookConsumerWidget {
  const AppBackground({
    super.key,
    this.child,
    this.hideEllipse = false,
    this.ellipseTrackingWidgetKey,
  });

  final Widget? child;
  final bool hideEllipse;
  final GlobalKey? ellipseTrackingWidgetKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ellipseOffset = useState(const Offset(0, -450.0));
    final ellipseSize = useState(500.0);

    useEffect(() {
      if (ellipseTrackingWidgetKey == null) {
        return null;
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        final renderBox = ellipseTrackingWidgetKey?.currentContext
            ?.findRenderObject() as RenderBox?;

        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero);
          final size = renderBox.size;
          final center = Offset(
              position.dx + size.width / 2, position.dy + size.height / 2);

          ellipseOffset.value = Offset(
            center.dx - ellipseSize.value / 2,
            center.dy - ellipseSize.value / 2,
          );
        }
      });

      return null;
    }, [ellipseTrackingWidgetKey]);

    final theme = Theme.of(context);

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            _buildBackgroundColor(theme),
            if (!hideEllipse) _buildEclipse(ellipseOffset, ellipseSize, theme),
            _buildGlassEffectBackground(),
            child ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Center _buildGlassEffectBackground() {
    return Center(
      child: GlassmorphicContainer(
        width: double.infinity,
        height: double.infinity,
        blur: 40,
        alignment: Alignment.bottomCenter,
        border: 2,
        borderRadius: 7,
        child: const Column(
          children: [],
        ),
      ),
    );
  }

  Positioned _buildEclipse(ValueNotifier<Offset> ellipseOffset,
      ValueNotifier<double> ellipseSize, ThemeData theme) {
    return Positioned(
      right: -20,

      //left: ellipseOffset.value.dx,
      top: ellipseOffset.value.dy,
      child: SizedBox(
        height: ellipseSize.value,
        width: ellipseSize.value,
        child: CircleAvatar(
          backgroundColor: theme.primaryColor
              .withOpacity(ellipseTrackingWidgetKey == null ? 0.8 : 0.2),
          radius: 500,
        ),
      ),
    );
  }

  Container _buildBackgroundColor(ThemeData theme) {
    return Container(
      color: theme.scaffoldBackgroundColor,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
