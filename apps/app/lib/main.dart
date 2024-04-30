import 'dart:ui';

import 'package:app/src/components/bars/scaffold_with_nested_navigation.dart';
import 'package:flutter/material.dart';
import 'package:app/src/features/bus_stop/presentation/bus_stop_widget.dart';
import 'package:app/src/features/bus_route/presentation/bus_route_widget.dart';
import 'package:app/src/features/navigation/navigation_widget.dart';
import 'package:app/src/features/messages/message_widget.dart';
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

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('An error occurred'.hardcoded),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}

class PutraBusApp extends StatelessWidget {
  const PutraBusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Putra Bus App',
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouter(
            initialLocation: '/bus-stop',
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
