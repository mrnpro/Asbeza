import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/components/index.dart';
import '../../../core/constants/index.dart';
import '../../screens.dart';
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
                  _buildCategories(isCategoriesPressed, size)
                ],
              ),
            ),
          ),
          _buildWand(),
        ],
      ),
    );
  }

  _buildCategories(ValueNotifier<bool> isCategoriesPressed, Size size) {
    return AnimateVisibility(
      isVisible: !isCategoryHidden,
      child: SizedBox(
        width: size.width / 3,
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

  _buildWand() {
    return Expanded(
      flex: 0,
      child: AnimateVisibility(
        isVisible: isCategoryHidden,
        child: Consumer(builder: (context, ref, _) {
          final isEclipseHidden = ref.watch(togleEclipseProvider);
          return AppContainer(
            onPressed: () {
              ref.read(togleEclipseProvider.notifier).state = !isEclipseHidden;
            },
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
            height: 75,
            child: SvgPicture.asset(
              Assets.assetsIconsWandIcon,
              color: isEclipseHidden ? null : theme.primaryColor,
            ),
          );
        }),
      ),
    );
  }
}
