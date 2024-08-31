import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/components/index.dart';
import '../../../core/config/theme-config/color_pallete.dart';
import '../../../core/constants/index.dart';
import '../../detail-screen/components/index.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final titleFontSize =
        (Theme.of(context).textTheme.displayLarge?.fontSize ?? 0.0) - 5;
    final theme = Theme.of(context);
    return AppContainer(
      radius: 20,
      width: size.width,
      gradient:
          LinearGradient(colors: ColorPallete.getThemeGradientColors(context)),
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
      // margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            buildimg(),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mango",
                      style: theme.textTheme.displayLarge
                          ?.copyWith(fontSize: titleFontSize),
                    ),
                    Text(
                      "130 ETB / 1kg",
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: theme.primaryColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ProductQuanity(),
                    const Gap(10),
                    Text(
                      "300 ETB",
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: theme.primaryColor),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      onPressed: () {},
    );
  }

  SizedBox buildimg() {
    return SizedBox(
        height: 100,
        child: Image.asset(Assets.assetsImagesProductImagesFruitsMango));
  }
}
