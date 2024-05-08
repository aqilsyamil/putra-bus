import 'package:app/src/features/bus_route/presentation/bus_route_screen.dart';
import 'package:app/src/features/bus_stop/presentation/bus_stop_screen.dart';
import 'package:app/src/features/messages/message_screen.dart';
import 'package:app/src/features/navigation/navigation_screen.dart';
import 'package:app/src/routing/scaffold_with_nested_navigation.dart';
import 'package:app/src/routing/app_startup.dart';
import 'package:app/src/routing/not_found_screen.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorBusStopKey =
    GlobalKey<NavigatorState>(debugLabel: 'busStop');
final _shellNavigatorRouteKey =
    GlobalKey<NavigatorState>(debugLabel: 'busRoute');
final _shellNavigatorNavigationKey =
    GlobalKey<NavigatorState>(debugLabel: 'navigation');
final _shellNavigatorMessagesKey =
    GlobalKey<NavigatorState>(debugLabel: 'messages');

enum AppRoute {
  onboarding,
  signIn,
  jobs,
  job,
  addJob,
  editJob,
  entry,
  addEntry,
  editEntry,
  entries,
  profile,
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  // rebuild GoRouter when app startup state changes
  final appStartupState = ref.watch(appStartupProvider);

  return GoRouter(
    initialLocation: '/bus-stop',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      if (appStartupState.isLoading || appStartupState.error != null) {
        return '/startup';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/startup',
        pageBuilder: (context, state) => NoTransitionPage(
          child: AppStartupWidget(
            onLoaded: (_) => const SizedBox.shrink(),
          ),
        ),
      ),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
                navigatorKey: _shellNavigatorBusStopKey,
                routes: [
                  GoRoute(
                      path: '/bus-stop',
                      builder: (context, state) => const BusStopScreen())
                ]),
            StatefulShellBranch(navigatorKey: _shellNavigatorRouteKey, routes: [
              GoRoute(
                  path: '/route',
                  builder: (context, state) => const BusRouteScreen())
            ]),
            StatefulShellBranch(
                navigatorKey: _shellNavigatorNavigationKey,
                routes: [
                  GoRoute(
                      path: '/navigation',
                      builder: (context, state) => const NavigationScreen())
                ]),
            StatefulShellBranch(
                navigatorKey: _shellNavigatorMessagesKey,
                routes: [
                  GoRoute(
                      path: '/messages',
                      builder: (context, state) => const MessagesScreen())
                ]),
          ]),
    ],
    errorPageBuilder: (context, state) =>
        const NoTransitionPage(child: NotFoundScreen()),
  );
}
