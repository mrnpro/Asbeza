import 'package:asbeza/core/constants/assets.dart';
import 'package:asbeza/core/enum/index.dart';
import 'package:asbeza/core/data/models/category-model/category_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'category_list_data.g.dart';

@Riverpod(keepAlive: true)
List<CategoriesModel> categoryListData(CategoryListDataRef _) => [
      CategoriesModel(
          iconPath: Assets.assetsImagesCategoriesOrangeCategory,
          title: "Fruit",
          theme: ThemeConfigEnum.fruitTheme),
      CategoriesModel(
          iconPath: Assets.assetsImagesCategoriesCabageCategory,
          title: "Vegetable",
          theme: ThemeConfigEnum.vegtableTheme),
      CategoriesModel(
          iconPath: Assets.assetsImagesCategoriesBerbereCategory,
          title: "Baltna",
          theme: ThemeConfigEnum.fruitTheme),
      CategoriesModel(
          iconPath: Assets.assetsImagesCategoriesBreadCategory,
          title: "Bakery",
          theme: ThemeConfigEnum.fruitTheme)
    ];
