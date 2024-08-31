import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/selected-category/slected_category_provider.dart';

class CustomSliderView extends HookConsumerWidget {
  final List<Widget> children;

  const CustomSliderView({super.key, required this.children});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: children.length);

    void changeTab(int index) {
      tabController.animateTo(index);
    }

    ref.listen(
      selectedCategoryProvider,
      (previous, next) {
        final index = ref.read(selectedCategoryProvider.notifier).getIndex();
        changeTab(index);
      },
    );
    useEffect(() {
      // this is to set(make) the theme v/s selected category persistent after disposal . .
      final index = ref.read(selectedCategoryProvider.notifier).getIndex();
      changeTab(index);
      /////////////////
      return null;
    }, [0]);

    return SliverFillRemaining(
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: children,
      ),
    );
  }
}
