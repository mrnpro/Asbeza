import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/components/index.dart';
import '../../../core/constants/index.dart';
import 'index.dart';

class SearchWidget extends HookConsumerWidget {
  const SearchWidget(
      {super.key,
      required this.size,
      required this.theme,
      required this.isCategoryHidden});

  final Size size;
  final ThemeData theme;
  final bool isCategoryHidden;

  @override
  Widget build(BuildContext context, ref) {
    final isCategoriesPressed = useState(false);
    if (isCategoryHidden) {
      isCategoriesPressed.value = false;
    }
    return SizedBox(
      width: size.width,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: AppContainer(
              onPressed: () {},
              height: 75,
              width: 19,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimateVisibility(
                    isVisible: !isCategoriesPressed.value,
                    child: SvgPicture.asset(
                      Assets.assetsIconsSearchIcon,
                    ),
                  ),
                  AnimateVisibility(
                    isVisible: isCategoriesPressed.value,
                    child: IconButton(
                        onPressed: () {
                          isCategoriesPressed.value = false;
                        },
                        icon: SvgPicture.asset(
                          Assets.assetsIconsArrowBackIcon,
                          color: theme.primaryColor,
                        )),
                  ),
                  AnimateVisibility(
                    isVisible: !isCategoriesPressed.value,
                    child: Row(
                      children: [
                        const Gap(26),
                        Text(
                          "Search Here",
                          style: theme.inputDecorationTheme.hintStyle,
                        ),
                      ],
                    ),
                  ),
                  _buildCategories(
                    isCategoriesPressed,
                  )
                ],
              ),
            ),
          ),
          AnimateVisibility(isVisible: isCategoryHidden, child: _buildWand()),
        ],
      ),
    );
  }

  _buildCategories(ValueNotifier<bool> isCategoriesPressed) {
    return Expanded(
      child: AnimateVisibility(
        isVisible: !isCategoryHidden,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            isCategoriesPressed.value = true;
          },
          child: CategoriesWidget.collapsed(
            spread: isCategoriesPressed.value,
          ),
        ),
      ),
    );
  }

  Expanded _buildWand() {
    return Expanded(
      flex: 1,
      child: AppContainer(
        onPressed: () {},
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
        height: 75,
        child: Expanded(child: SvgPicture.asset(Assets.assetsIconsWandIcon)),
      ),
    );
  }
}
