import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../constants/index.dart';

class BuyNowBtn extends StatelessWidget {
  const BuyNowBtn({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const Gap(30),
        ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: theme.primaryColor),
            onPressed: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(Assets.assetsIconsCartIcon)),
                const Gap(8),
                Text(
                  "Buy",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(18),
                IgnorePointer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 9,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.black.withOpacity(.10)),
                      onPressed: () {},
                      child: Text(
                        "123 ETB",
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
