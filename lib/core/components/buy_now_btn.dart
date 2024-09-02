import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    height: 25.w,
                    width: 25.w,
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
                    padding: EdgeInsets.symmetric(
                      vertical: 9.h,
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
