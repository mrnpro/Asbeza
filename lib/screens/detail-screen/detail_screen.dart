import 'package:asbeza/core/components/index.dart';
import 'package:asbeza/core/data/models/product-model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/index.dart';

class DetailScreen extends StatefulHookConsumerWidget {
  const DetailScreen({super.key, required this.product});
  final ProductModel product;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  GlobalKey productImgKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: AppBackground(
        ellipseTrackingWidgetKey: productImgKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const DetailsAppBar(),
                ProductImage(widget: widget, productImgKey: productImgKey),
                const ProductQuanity(),
                ProductTitlePriceAddress(
                  product: widget.product,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Text(
                    "Discover the freshest, crispest cabbage available! Perfect for salads, stir-fries, and homemade coleslaw, our cabbage is sourced from local farms, ensuring top quality and taste. Packed with nutrients and bursting with flavor, this versatile vegetable is a must-have in your kitchen. Order now for a delicious and healthy addition to your meals!",
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: theme.primaryColor.withOpacity(.5)),
                  ),
                ),
                BuyNowBtn(
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
