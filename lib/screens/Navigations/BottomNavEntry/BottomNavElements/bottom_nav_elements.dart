import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/index.dart';
part 'bottom_nav_elements.g.dart';

@riverpod
class BottomNavElementsNotifier extends _$BottomNavElementsNotifier {
  @override
  List<BottomNavBarElement> build() {
    return [
      BottomNavBarElement(
          icon: Assets.assetsIconsHomeIcon, title: "", isActive: true),
      BottomNavBarElement(
          icon: Assets.assetsIconsBagIcon, title: "", isActive: false),
      BottomNavBarElement(
          icon: Assets.assetsIconsBellIcon, title: "", isActive: false),
      BottomNavBarElement(
          icon: Assets.assetsIconsProfileIcon, title: "", isActive: false),
    ];
  }

  void selectElement(int toIndex) {
    final newItems = state.map((element) {
      final index = state.indexOf(element);
      final isActive = toIndex == index;
      return element.copyIsActive(isActive: isActive);
    });

    state = [...newItems];
  }

  int selectedIndex() {
    return state.indexWhere((element) {
      return element.isActive;
    });
  }
}

class BottomNavBarElement {
  String icon;
  String title;
  bool isActive;

  BottomNavBarElement(
      {required this.icon, required this.title, required this.isActive});
  BottomNavBarElement copyIsActive({
    bool? isActive,
  }) {
    return BottomNavBarElement(
        icon: icon, title: title, isActive: isActive ?? this.isActive);
  }
}
