import 'package:app/src/services/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PutraBusApp extends ConsumerWidget {
  const PutraBusApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Putra Bus App',
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
    );
  }
}
