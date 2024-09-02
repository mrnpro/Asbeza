import 'package:asbeza/core/config/theme-config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      if (scrollController.position.pixels >= 106.h) {
        isCategoriesHidden.value = false;
      } else if (scrollController.position.pixels <= 106.h) {
        isCategoriesHidden.value = true;
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
        body: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            CategoriesWidget(
              key: categoriesKey,
            ),
          ],
          body: CustomScrollView(
            controller: ScrollController(),
            slivers: const [
              CustomSliderView(
                children: [
                  FruitLayout(),
                  VegetableLayout(),
                ],
              )
            ],
          ),
        ));
  }
}
