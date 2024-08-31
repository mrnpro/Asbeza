import 'package:asbeza/core/data/models/product-model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class ProductTitlePriceAddress extends ConsumerWidget {
  const ProductTitlePriceAddress({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(31),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.title,
                style: theme.textTheme.displayLarge,
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(text: "${product.price} ETB/"),
                  TextSpan(
                      text: " 1kg",
                      style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.primaryColor.withOpacity(.30)))
                ]),
                style: theme.textTheme.labelLarge
                    ?.copyWith(color: theme.primaryColor),
              )
            ],
          ),
          Text(product.address,
              style: theme.textTheme.labelLarge
                  ?.copyWith(color: theme.primaryColor)),
          Divider(
            color: theme.primaryColor,
          )
        ],
      ),
    );
  }
}
