import 'package:asbeza/core/config/index.dart';
import 'package:asbeza/core/data/category_list_data/category_list_data.dart';
import 'package:asbeza/core/data/models/category-model/category_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slected_category_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedCategory extends _$SelectedCategory {
  @override
  CategoriesModel build() {
    final initialData = ref.read(categoryListDataProvider).first;
    return initialData;
  }

  void selectCategory(CategoriesModel newCategory) {
    state = newCategory;
    // update theme after changing category
    _updateTheme();
  }

  int getIndex() {
    final categoryList = ref.read(categoryListDataProvider);
    final index = categoryList.indexOf(state);
    return index;
  }

  _updateTheme() {
    ref.read(themeProviderProvider.notifier).changeTheme(state.theme);
  }
}
