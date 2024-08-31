import 'package:asbeza/core/data/models/product-model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens.dart';
import 'index.dart';

class ProductsListWidget extends StatelessWidget {
  final List<ProductModel> products;
  final double aspectRatio;
  final double borderRadius;
  final List<Color> gradient;

  const ProductsListWidget({
    required this.products,
    required this.gradient,
    this.aspectRatio = .9,
    this.borderRadius = 8.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 190 / 206,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final product = products[index];
            return ProductItemWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => DetailScreen(product: product),
                  ),
                );
              },
              onCartIconPressed: () {},
              aspectRatio: aspectRatio,
              gradient: gradient,
              borderRadius: borderRadius,
              product: product,
            );
          },
          childCount: products.length,
        ),
      ),
    );
  }
}
