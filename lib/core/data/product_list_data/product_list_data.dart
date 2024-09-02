import 'package:asbeza/core/constants/assets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../enum/index.dart';
import '../models/product-model/product_model.dart';

part 'product_list_data.g.dart';

@Riverpod(keepAlive: true)
List<ProductModel> productDataList(ProductDataListRef _) => [
      const ProductModel(
        id: '1',
        category: Category.vegetable,
        imagePath: Assets.assetsImagesProductImagesVegetableCabage,
        title: 'Cabbage',
        price: 130.0,
        address: 'Addis Ababa',
        weight: 4.0,
        description:
            'Discover the freshest, crispiest cabbage available! Perfect for salads, stir-fries, and homemade coleslaw, our cabbage is sourced from local farms, ensuring top quality and taste. Packed with nutrients and bursting with flavor, this versatile vegetable is a must-have in your kitchen. Order now for a delicious and healthy addition to your meals!',
      ),
      const ProductModel(
        id: '2',
        category: Category.vegetable,
        imagePath: Assets.assetsImagesProductImagesVegetableSalad,
        title: 'Salad',
        price: 30.0,
        address: 'Addis Ababa',
        weight: 0.5,
        description:
            'Fresh and nutritious salad, perfect for a quick, healthy meal. Sourced locally to provide the best quality.',
      ),
      const ProductModel(
        id: '3',
        category: Category.vegetable,
        imagePath: Assets.assetsImagesProductImagesVegetableBroccoli,
        title: 'Broccoli',
        price: 150.0,
        address: 'Addis Ababa',
        weight: 1.0,
        description:
            'Our broccoli is packed with nutrients and flavor. Perfect for a variety of dishes, including stir-fries, salads, and more. Sourced from the best local farms.',
      ),
      const ProductModel(
        id: '4',
        category: Category.vegetable,
        imagePath: Assets.assetsImagesProductImagesVegetableSpinach,
        title: 'Spinach',
        price: 60.0,
        address: 'Addis Ababa',
        weight: 0.3,
        description:
            'Fresh spinach leaves, perfect for salads, smoothies, and cooking. Loaded with nutrients and sourced from local farms to ensure quality and freshness.',
      ),
      const ProductModel(
        id: '5',
        category: Category.vegetable,
        imagePath: Assets.assetsImagesProductImagesVegetableCabage,
        title: 'Cabbage',
        price: 130.0,
        address: 'Addis Ababa',
        weight: 4.0,
        description:
            'Discover the freshest, crispiest cabbage available! Perfect for salads, stir-fries, and homemade coleslaw, our cabbage is sourced from local farms, ensuring top quality and taste. Packed with nutrients and bursting with flavor, this versatile vegetable is a must-have in your kitchen. Order now for a delicious and healthy addition to your meals!',
      ),
      const ProductModel(
        id: '6',
        category: Category.vegetable,
        imagePath: Assets.assetsImagesProductImagesVegetableSalad,
        title: 'Salad',
        price: 30.0,
        address: 'Addis Ababa',
        weight: 0.5,
        description:
            'Fresh and nutritious salad, perfect for a quick, healthy meal. Sourced locally to provide the best quality.',
      ),
      const ProductModel(
        id: '7',
        category: Category.fruit,
        imagePath: Assets.assetsImagesProductImagesFruitsApple,
        title: 'Apple',
        price: 120.0,
        address: 'Addis Ababa',
        weight: 1.0,
        description:
            'Crisp and juicy apples, perfect for a healthy snack. Sourced from local orchards to provide the best flavor and quality.',
      ),
      const ProductModel(
        id: '8',
        category: Category.fruit,
        imagePath: Assets.assetsImagesProductImagesFruitsMango,
        title: 'Mango',
        price: 90.0,
        address: 'Addis Ababa',
        weight: 1.0,
        description:
            'Sweet and succulent mangoes, ideal for a delightful snack or creating smoothies. Handpicked from local farms to guarantee the finest flavor and freshness.',
      ),
      const ProductModel(
        id: '9',
        category: Category.fruit,
        imagePath: Assets.assetsImagesProductImagesFruitsGraps,
        title: 'Grapes',
        price: 40.0,
        address: 'Addis Ababa',
        weight: 0.5,
        description:
            'Plump and juicy grapes, perfect for a quick snack or adding to your favorite recipes. Carefully selected from local vineyards to ensure top-notch sweetness and quality.',
      ),
      const ProductModel(
        id: '10',
        category: Category.fruit,
        imagePath: Assets.assetsImagesProductImagesFruitsMango,
        title: 'Mango',
        price: 90.0,
        address: 'Addis Ababa',
        weight: 1.0,
        description:
            'Sweet and succulent mangoes, ideal for a delightful snack or creating smoothies. Handpicked from local farms to guarantee the finest flavor and freshness.',
      ),
      const ProductModel(
        id: '11',
        category: Category.fruit,
        imagePath: Assets.assetsImagesCategoriesOrangeCategory,
        title: 'Orange',
        price: 10.0,
        address: 'Addis Ababa',
        weight: 0.5,
        description:
            'Plump and juicy grapes, perfect for a quick snack or adding to your favorite recipes. Carefully selected from local vineyards to ensure top-notch sweetness and quality.',
      ),
      const ProductModel(
        id: '12',
        category: Category.fruit,
        imagePath: Assets.assetsImagesProductImagesFruitsGraps,
        title: 'Grapes',
        price: 40.0,
        address: 'Addis Ababa',
        weight: 0.5,
        description:
            'Plump and juicy grapes, perfect for a quick snack or adding to your favorite recipes. Carefully selected from local vineyards to ensure top-notch sweetness and quality.',
      ),
      const ProductModel(
        id: '13',
        category: Category.fruit,
        imagePath: Assets.assetsImagesProductImagesFruitsGraps,
        title: 'Grapes',
        price: 40.0,
        address: 'Addis Ababa',
        weight: 0.5,
        description:
            'Plump and juicy grapes, perfect for a quick snack or adding to your favorite recipes. Carefully selected from local vineyards to ensure top-notch sweetness and quality.',
      ),
    ];
