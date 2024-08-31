import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BannerWidget extends HookConsumerWidget {
  const BannerWidget({super.key, required this.bannerPath});
  final String bannerPath;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18.0),
        child: Image.asset(
          bannerPath,
        ),
      ),
    );
  }
}
