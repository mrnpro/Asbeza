import 'package:asbeza/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late ProviderContainer container;
void main() {
  container = ProviderContainer(
    overrides: [],
  );
  runApp(UncontrolledProviderScope(
    container: container,
    child: const App(),
  ));
}
