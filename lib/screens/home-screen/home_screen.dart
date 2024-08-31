import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'layouts/index.dart';
import 'widgets/index.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final GlobalKey categoriesKey = GlobalKey();
    final isCategoriesHidden = useState(true);
    void scrollListener() {
      if (categoriesKey.currentContext != null) {
        final RenderObject? renderObject =
            categoriesKey.currentContext!.findRenderObject();

        if (renderObject is RenderSliver) {
          final SliverConstraints constraints = renderObject.constraints;

          // If the sliver's layout extent is zero, it is not visible

          isCategoriesHidden.value = !(constraints.scrollOffset > 0);
        }
      }
    }

    useEffect(
      () {
        scrollController.addListener(scrollListener);

        return null;
      },
    );

    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: SafeArea(
          child: SearchWidget(
            size: size,
            theme: theme,
            isCategoryHidden: isCategoriesHidden.value,
          ),
        ),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          CategoriesWidget(
            key: categoriesKey,
          ),
          CustomSliderView(
            children: [
              FruitLayout(
                controller: scrollController,
              ),
              VegetableLayout(
                controller: scrollController,
              ),
            ],
          )
        ],
      ),
    );
  }
}
