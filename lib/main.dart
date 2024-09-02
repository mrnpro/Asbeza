import 'package:asbeza/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/size.dart';

late ProviderContainer container;

void main() {
  container = ProviderContainer(
    overrides: [],
  );
  runApp(UncontrolledProviderScope(
      container: container,
      child: ScreenUtilInit(
        designSize: designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const App();
        },
      )));
}
