import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../enum/index.dart';
part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String imagePath,
    required String title,
    required double price,
    required String address,
    required double weight,
    required String description,
    required Category category,
  }) = _ProductModel;
}
