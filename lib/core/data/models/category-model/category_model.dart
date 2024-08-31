import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../enum/index.dart';
part 'category_model.freezed.dart';

@freezed
class CategoriesModel with _$CategoriesModel {
  factory CategoriesModel(
      {required String iconPath,
      required String title,
      required ThemeConfigEnum theme}) = _CategoriesModel;
}
