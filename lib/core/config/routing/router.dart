import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/feature/app/auth/presentation/ui/screen/login_screen.dart';
import 'package:remy/feature/app/auth/presentation/ui/screen/signup_screen.dart';
import 'package:remy/feature/app/root/presentation/ui/screen/root_screen.dart';
import '../../../feature/splash.dart';
import 'router_config.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');

class GRouter {
  static GoRouter get router => _router;

  static BuildContext? get context => router.routerDelegate.navigatorKey.currentContext;

  static RouterConfiguration get config => _config;

  static final RouterConfiguration _config = RouterConfiguration.init();

  static final GoRouter _router = GoRouter(
    initialLocation: _config.authRoutes.login,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
          path: _config.homeRoutes.homeScreen,
          name: _config.homeRoutes.homeScreen,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return _builderPage(
              child: const RootScreen(),
              state: state,
            );
          }),
      GoRoute(
        path: _config.authRoutes.login,
        name: _config.authRoutes.login,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: const LoginScreen(),
            state: state,
          );
        },
        routes: [
          GoRoute(
            path: _config.authRoutes.signUp,
            name: _config.authRoutes.signUp,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child: const SignupScreen(),
                state: state,
              );
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Container(),
  );

  static Page<dynamic> _builderPage<T>({required Widget child, required GoRouterState state}) {
    if (Platform.isIOS) {
      return CupertinoPage<T>(child: child, key: state.pageKey);
    } else {
      return MaterialPage<T>(child: child, key: state.pageKey);
    }
  }
}
