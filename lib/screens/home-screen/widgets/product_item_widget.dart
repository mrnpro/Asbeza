import 'package:asbeza/core/components/index.dart';
import 'package:asbeza/core/config/theme-config/color_pallete.dart';
import 'package:asbeza/core/constants/assets.dart';
import 'package:asbeza/core/data/models/product-model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductItemWidget extends StatelessWidget {
  final double aspectRatio;
  final double borderRadius;
  final ProductModel product;
  final VoidCallback onPressed;
  final VoidCallback onCartIconPressed;
  final List<Color> gradient;
  const ProductItemWidget({
    required this.product,
    required this.gradient,
    required this.onCartIconPressed,
    required this.onPressed,
    this.aspectRatio = 1.0,
    this.borderRadius = 8.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppContainer(
            gradient: LinearGradient(
              colors: [...gradient],
              stops: const [0.0, 0.55, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            // margin: const EdgeInsets.all(15),
            onPressed: onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Hero(
                      tag: product.id, child: Image.asset(product.imagePath)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: ColorPallete.kwhite),
                        ),
                        Text(
                          "${product.price} ETB",
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: theme.primaryColor),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
        Positioned(
            right: 10,
            bottom: -13,
            child: IconButton.filled(
              style: IconButton.styleFrom(
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(.75),
              ),
              onPressed: onCartIconPressed,
              icon: SvgPicture.asset(Assets.assetsIconsCartIcon),
            ))
      ],
    );
  }
}
