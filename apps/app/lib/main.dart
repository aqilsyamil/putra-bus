import 'package:app/components/bars/scaffold_with_nested_navigation.dart';
import 'package:flutter/material.dart';
import 'package:app/features/bus_stop/presentation/bus_stop_widget.dart';
import 'package:app/features/bus_route/presentation/bus_route_widget.dart';
import 'package:app/features/navigation/navigation_widget.dart';
import 'package:app/features/messages/message_widget.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorBusStopKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellBusStop');
final _shellNavigatorRouteKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellRoute');
final _shellNavigatorNavigationKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigation');
final _shellNavigatorMessagesKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellMessages');

void main() {
  usePathUrlStrategy();
  runApp(const PutraBusApp());
}

class PutraBusApp extends StatelessWidget {
  const PutraBusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Putra Bus App',
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouter(
            initialLocation: '/',
            navigatorKey: _rootNavigatorKey,
            debugLogDiagnostics: true,
            routes: [
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
                              builder: (context, state) =>
                                  const BusStopWidget())
                        ]),
                    StatefulShellBranch(
                        navigatorKey: _shellNavigatorRouteKey,
                        routes: [
                          GoRoute(
                              path: '/route',
                              builder: (context, state) =>
                                  const BusRouteWidget())
                        ]),
                    StatefulShellBranch(
                        navigatorKey: _shellNavigatorNavigationKey,
                        routes: [
                          GoRoute(
                              path: '/navigation',
                              builder: (context, state) =>
                                  const NavigationWidget())
                        ]),
                    StatefulShellBranch(
                        navigatorKey: _shellNavigatorMessagesKey,
                        routes: [
                          GoRoute(
                              path: '/messages',
                              builder: (context, state) =>
                                  const MessagesWidget())
                        ]),
                  ]),
            ]));
  }
}
