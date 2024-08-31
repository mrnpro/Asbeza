import 'package:asbeza/core/components/index.dart';
import 'package:asbeza/core/config/theme-config/color_pallete.dart';
import 'package:asbeza/core/constants/assets.dart';
import 'package:asbeza/core/data/models/product-model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/index.dart';

class OrdersScreen extends StatefulHookConsumerWidget {
  const OrdersScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Expanded(
        child: Stack(
      children: [
        AppBackground(
          child: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Order Page",
                        style: theme.textTheme.displayLarge,
                      ),
                      const Gap(20),
                      const OrderItem(),
                      const OrderItem(),
                      const OrderItem(),
                    ]),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 150,
          child: BuyNowBtn(
            onPressed: () {},
          ),
        )
      ],
    ));
  }
}
