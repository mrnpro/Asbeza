import 'package:flutter/material.dart';

import '../../screens.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.widget,
    required this.productImgKey,
  });

  final DetailScreen widget;
  final GlobalKey<State<StatefulWidget>> productImgKey;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
          width: 300,
          child: Hero(
            tag: widget.product.id,
            child: Image.asset(key: productImgKey, widget.product.imagePath),
          )),
    );
  }
}
