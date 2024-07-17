import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/feature/app/auth/presentation/ui/screen/login_screen.dart';
import 'package:remy/feature/app/auth/presentation/ui/screen/signup_screen.dart';
import 'package:remy/feature/app/root/presentation/ui/screen/root_screen.dart';
import '../../../feature/app/home/data/model/order_details_model.dart';
import '../../../feature/app/home/domain/use_case/order_details.dart';
import '../../../feature/app/home/presentation/ui/screen/all_dep.dart';
import '../../../feature/app/home/presentation/ui/screen/confirm_screen.dart';
import '../../../feature/app/home/presentation/ui/screen/department_screen.dart';
import '../../../feature/app/home/presentation/ui/screen/details_mall.dart';
import '../../../feature/app/home/presentation/ui/screen/details_product.dart';
import '../../../feature/app/home/presentation/ui/screen/order_details_page.dart';
import '../../../feature/app/home/presentation/ui/screen/order_screen.dart';
import '../../../feature/app/home/presentation/ui/screen/product_dep.dart';
import '../../../feature/app/home/presentation/ui/screen/profile_screen.dart';
import '../../../feature/app/home/presentation/ui/screen/select_location.dart';
import '../../../feature/app/home/presentation/ui/screen/show_order_screen.dart';
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
          },
        routes: [
          GoRoute(
            path: LocationPage.name,
            name: LocationPage.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child:  LocationPage(),
                state: state,
              );
            },

          ),
          GoRoute(
            path: OrderPage.name,
            name: OrderPage.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child:  OrderPage(),
                state: state,
              );
            },

          ),
          GoRoute(
            path: ProfileScreen.name,
            name: ProfileScreen.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child:  ProfileScreen(),
                state: state,
              );
            },
            routes: [
              GoRoute(
                  path: OrderDetailsPage.name,
                  name: OrderDetailsPage.name,
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    return _builderPage(
                      child:  OrderDetailsPage(orderDetailsParam: state.extra as OrderDetailsParams,),
                      state: state,
                    );
                  },
              )
            ]

          ),
          GoRoute(
            path: OrderScreen.name,
            name: OrderScreen.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child:  const OrderScreen(),
                state: state,
              );
            },
            routes: [
              GoRoute(
                  path: ConfirmScreen.name,
                  name: ConfirmScreen.name,
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    return _builderPage(
                      child:  ConfirmScreen(data: state.extra as OrderDetailsModel,),
                      state: state,
                    );
                  },

              ),
            ]
          ),
          GoRoute(
              path:AllDepartmentScreen.name,
              name:AllDepartmentScreen.name,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return _builderPage(
                  child:  AllDepartmentScreen(idMoll: state.extra as String,),
                  state: state,
                );
              },
            routes: [
              GoRoute(
                path: DetailsMall.name,
                name: DetailsMall.name,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _builderPage(
                    child:  DetailsMall(idMall: state.extra as String,),
                    state: state,
                  );
                },

              ),
              GoRoute(
                path: AllProductDepartmentScreen.name,
                name: AllProductDepartmentScreen.name,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _builderPage(
                    child:  AllProductDepartmentScreen(idDep: state.extra as String,),
                    state: state,
                  );
                },
                routes: [
                  GoRoute(
                    path: DetailsProduct.name,
                    name: DetailsProduct.name,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      return _builderPage(
                        child:  DetailsProduct(idProduct: state.extra as String,),
                        state: state,
                      );
                    },
                  ),
                ]

              ),
              GoRoute(
                path: _config.homeRoutes.department,
                name: _config.homeRoutes.department,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _builderPage(
                    child:  DetailsScreen(idMoll: state.extra as String,),
                    state: state,
                  );
                },


              ),
            ]
          ),

        ]

      ),
      GoRoute(
        path: _config.authRoutes.login,
        name: _config.authRoutes.login,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child:  LoginScreen(),
            state: state,
          );
        },
        routes: [
          GoRoute(
            path: _config.authRoutes.signUp,
            name: _config.authRoutes.signUp,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child:  SignupScreen(),
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
