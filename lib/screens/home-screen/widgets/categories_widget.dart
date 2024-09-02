import 'package:asbeza/core/components/index.dart';
import 'package:asbeza/core/data/category_list_data/category_list_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/data/models/category-model/category_model.dart';
import '../../../providers/selected-category/slected_category_provider.dart';

class CategoriesWidget extends ConsumerWidget {
  const CategoriesWidget({
    super.key,
    this.collapsed = false,
    this.spread = false,
  });
  final bool collapsed;

  final bool spread;
  factory CategoriesWidget.collapsed({required bool spread}) {
    return CategoriesWidget(
      collapsed: true,
      spread: spread,
    );
  }
  @override
  Widget build(BuildContext context, ref) {
    final categoryDataList = ref.watch(categoryListDataProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    return switch (collapsed) {
      true => _buildCategories(categoryDataList, selectedCategory, ref),
      _ => SliverToBoxAdapter(
          child: _buildCategories(categoryDataList, selectedCategory, ref),
        )
    };
  }

  Padding _buildCategories(List<CategoriesModel> categoryDataList,
      CategoriesModel selectedCategory, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: switch (collapsed) {
          true => _buildCategoryCollapsedList(
              categoryDataList, selectedCategory, ref),
          _ => _buildCategoryList(categoryDataList, selectedCategory, ref)
        });
  }

  _buildCategoryList(List<CategoriesModel> categoryDataList,
      CategoriesModel selectedCategory, WidgetRef ref) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(categoryDataList.length, (index) {
          final category = categoryDataList[index];
          final isSelected = selectedCategory == category;
          return _CategoryWidget(
            isSelected: isSelected,
            onPressed: () {
              ref
                  .read(selectedCategoryProvider.notifier)
                  .selectCategory(category);
            },
            category: category,
          );
        }));
  }

  _selectCategory({required CategoriesModel category, required WidgetRef ref}) {
    ref.read(selectedCategoryProvider.notifier).selectCategory(category);
  }

  _buildCategoryCollapsedList(List<CategoriesModel> categoryDataList,
      CategoriesModel selectedCategory, WidgetRef ref) {
    return SizedBox(
        child: Stack(clipBehavior: Clip.none, children: [
      ...List.generate(categoryDataList.length, (index) {
        final category = categoryDataList[index];
        final isSelected = selectedCategory == category;

        final position = index * (spread ? 70.0 : 35.0);
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 100),
          top: 8,
          left: position,
          child: IgnorePointer(
            ignoring: !spread,
            child: _CategoryCollapsedWidget(
              isSelected: isSelected,
              onPressed: () {
                _selectCategory(category: category, ref: ref);
              },
              category: category,
            ),
          ),
        );
      }),
    ]));
  }
}

class _CategoryWidget extends ConsumerWidget {
  final VoidCallback onPressed;
  final CategoriesModel category;
  final bool isSelected;
  const _CategoryWidget(
      {required this.onPressed,
      required this.category,
      this.isSelected = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppContainer(
      color:
          isSelected ? Theme.of(context).primaryColor : const Color(0xFF6F6F6F),
      onPressed: onPressed,
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(9),
      width: 91.w,
      height: 106.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.iconPath,
            height: 66.h,
          ),
          Text(
            category.title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isSelected ? Theme.of(context).primaryColor : null),
          )
        ],
      ),
    );
  }
}

class _CategoryCollapsedWidget extends ConsumerWidget {
  final VoidCallback onPressed;
  final CategoriesModel category;
  final bool isSelected;
  const _CategoryCollapsedWidget(
      {required this.onPressed,
      required this.category,
      this.isSelected = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppContainer(
      useOpacity: false,
      useBorder: true,
      radius: 100,
      color: isSelected
          ? Theme.of(context).primaryColor
          : const Color.fromARGB(255, 51, 51, 51),
      onPressed: onPressed,
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(9),
      width: 50.w,
      height: 50.w,
      child: Image.asset(
        category.iconPath,
      ),
    );
  }
}



/**
 * 
 
class _CategoriesHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _CategoriesHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final hasOverlapped = shrinkOffset > 0.0;
    return Container(
        color: hasOverlapped ? Colors.black.withOpacity(.9) : null,
        child: child);
  }

  @override
  double get maxExtent => 106;

  @override
  double get minExtent => 106;

  @override
  bool shouldRebuild(_CategoriesHeaderDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}

 */