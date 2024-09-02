import 'package:asbeza/core/config/theme-config/color_pallete.dart';
import 'package:asbeza/core/constants/assets.dart';
import 'package:asbeza/core/data/product_list_data/product_list_data.dart';
import 'package:asbeza/core/enum/index.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/index.dart';

class FruitLayout extends HookConsumerWidget {
  final ScrollController controller;

  const FruitLayout({super.key, required this.controller});

  @override
  Widget build(BuildContext context, ref) {
    final productsList = ref.watch(productDataListProvider);
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      slivers: [
        const BannerWidget(
          bannerPath: Assets.assetsImagesBannersFruitsBanner,
        ),
        ProductsListWidget(
            gradient: ColorPallete.fruitGradient,
            products: productsList
                .where((product) => product.category == Category.fruit)
                .toList())
      ],
    );
  }
}