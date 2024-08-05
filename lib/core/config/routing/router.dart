import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/feature/app/auth/presentation/ui/screen/login_screen.dart';
import 'package:remy/feature/app/auth/presentation/ui/screen/signup_screen.dart';
import 'package:remy/feature/app/root/presentation/ui/screen/root_screen.dart';
import '../../../feature/app/home/data/model/home_model.dart';
import '../../../feature/app/home/data/model/order_details_model.dart';
import '../../../feature/app/home/domain/use_case/order_details.dart';
import '../../../feature/app/home/presentation/ui/screen/about.dart';
import '../../../feature/app/home/presentation/ui/screen/all_dep.dart';
import '../../../feature/app/home/presentation/ui/screen/boarding_screen.dart';
import '../../../feature/app/home/presentation/ui/screen/cart_page.dart';
import '../../../feature/app/home/presentation/ui/screen/confirm_edite.dart';
import '../../../feature/app/home/presentation/ui/screen/confirm_screen.dart';
import '../../../feature/app/home/presentation/ui/screen/department_screen.dart';
import '../../../feature/app/home/presentation/ui/screen/details_mall.dart';
import '../../../feature/app/home/presentation/ui/screen/details_product.dart';
import '../../../feature/app/home/presentation/ui/screen/edite_cart.dart';
import '../../../feature/app/home/presentation/ui/screen/final_edite.dart';
import '../../../feature/app/home/presentation/ui/screen/moll_home.dart';
import '../../../feature/app/home/presentation/ui/screen/my_point.dart';
import '../../../feature/app/home/presentation/ui/screen/order_details_page.dart';
import '../../../feature/app/home/presentation/ui/screen/order_screen.dart';
import '../../../feature/app/home/presentation/ui/screen/product_dep.dart';
import '../../../feature/app/home/presentation/ui/screen/product_home.dart';
import '../../../feature/app/home/presentation/ui/screen/profile_page.dart';
import '../../../feature/app/home/presentation/ui/screen/profile_screen.dart';
import '../../../feature/app/home/presentation/ui/screen/select_location.dart';
import '../../../feature/app/home/presentation/ui/screen/show_order_screen.dart';
import '../../../feature/app/home/presentation/ui/screen/splash.dart';
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
    initialLocation:SplashPage.name,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: SplashPage.name,
        name: SplashPage.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child:  SplashPage(),
            state: state,
          );
        },
        routes: [
          GoRoute(
            path: BoardingScreen.name,
            name: BoardingScreen.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child:  BoardingScreen(),
                state: state,
              );
            },

          ),
        ]
      ),
      GoRoute(
          path: _config.homeRoutes.homeScreen,
          name: _config.homeRoutes.homeScreen,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return _builderPage(
              child:  RootScreen(),
              state: state,
            );
          },
        routes: [
          GoRoute(
            path: AboutScreen.name,
            name: AboutScreen.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child:  AboutScreen(),
                state: state,
              );
            },

          ),GoRoute(
            path: ProductHomeScreen.name,
            name: ProductHomeScreen.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child:  ProductHomeScreen(products: state.extra as List<ProductItem>,),
                state: state,
              );
            },

          ),
          GoRoute(
            path: CartPage.name,
            name: CartPage.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child:  CartPage(),
                state: state,
              );
            },

          ),
          GoRoute(
            path: MollHomeScreen.name,
            name: MollHomeScreen.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child:  MollHomeScreen(mall: state.extra as List<Mall>,),
                state: state,
              );
            },
          ),
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
            path: MyPointPage.name,
            name: MyPointPage.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child:  MyPointPage(),
                state: state,
              );
            },

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
                  routes: [
                    GoRoute(
                        path: EditeCartPage.name,
                        name: EditeCartPage.name,
                        pageBuilder: (BuildContext context, GoRouterState state) {
                          return _builderPage(
                            child:  EditeCartPage(id: state.extra as String,),
                            state: state,
                          );
                        },
                        routes: [
                          GoRoute(
                              path: EditeOrderScreen.name,
                              name: EditeOrderScreen.name,
                              pageBuilder: (BuildContext context, GoRouterState state) {
                                return _builderPage(
                                  child:  EditeOrderScreen(id: state.extra as String,),
                                  state: state,
                                );
                              },
                              routes: [
                                GoRoute(
                                    path: FinalEditeScreen.name,
                                    name: FinalEditeScreen.name,
                                    pageBuilder: (BuildContext context, GoRouterState state) {
                                      return _builderPage(
                                        child:  FinalEditeScreen(data: state.extra as OrderDetailsModel,),
                                        state: state,
                                      );
                                    },
                                    routes: [

                                    ]
                                ),
                              ]
                          ),
                        ]
                    ),
                  ]
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
