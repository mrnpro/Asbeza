import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_size_notifier.g.dart';

@riverpod
class ProductSizeNotifier extends _$ProductSizeNotifier {
  @override
  int build() {
    return 4;
  }

  void increaseSize() {
    state++;
  }

  void decreaseSize() {
    state--;
  }
}
