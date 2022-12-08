import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../screen/detail.dart';
import '../screen/my_cart.dart';
import '../screen/screen_book.dart';
import '../screen/screen_profile.dart';
import '../screen/sreen_wishlist.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
const _scaffoldKey = ValueKey<String>('App scaffold');
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/book',
  routes: <RouteBase>[
    /// Application shell
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: <RouteBase>[
        /// The first screen to display in the bottom navigation bar.
        GoRoute(
          path: '/book',
          builder: (BuildContext context, GoRouterState state) {
            return const ScreenBook();
          },
          // pageBuilder: (context, state) => CustomTransitionPage(
          //   child: const ScreenBook(),
          //   transitionDuration: const Duration(seconds: 2),
          //   transitionsBuilder:
          //       (context, animation, secondaryAnimation, child) => child,
          // ),
          routes: <RouteBase>[
            // The details screen to display stacked on the inner Navigator.
            // This will cover screen A but not the application shell.
            GoRoute(
              path: ':id',
              name: 'DetailBook',
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) => CustomTransitionPage(
                child: DetailsScreen(
                  id: int.tryParse(state.params['id'] ?? ''),
                ),
                // transitionDuration: const Duration(seconds: 1),
                // transitionsBuilder:
                //     (context, animation, secondaryAnimation, child) => child,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(
                  key: _scaffoldKey,
                  opacity: animation,
                  child: child,
                ),
              ),
              // builder: (BuildContext context, GoRouterState state) {
              //   return DetailsScreen(
              //     id: int.tryParse(state.params['id'] ?? ''),
              //   );
              // },
            ),
          ],
        ),

        /// Displayed when the second item in the the bottom navigation bar is
        /// selected.
        GoRoute(
          path: '/wishlist',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const ScreenWishlist(),
            transitionDuration: const Duration(seconds: 2),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          ),
          // builder: (BuildContext context, GoRouterState state) {
          //   return const ScreenWishlist();
          // },
          routes: <RouteBase>[
            /// Same as "/a/details", but displayed on the root Navigator by
            /// specifying [parentNavigatorKey]. This will cover both screen B
            /// and the application shell.
            GoRoute(
              path: ':id',
              name: 'DetailWishlist',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return DetailsScreen(
                    id: int.tryParse(state.params['id'] ?? ''));
              },
            ),
          ],
        ),

        GoRoute(
          path: '/mycart',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const ScreenMycart(),
            transitionDuration: const Duration(seconds: 2),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          ),
          // builder: (BuildContext context, GoRouterState state) {
          //   return const ScreenWishlist();
          // },
          routes: <RouteBase>[
            /// Same as "/a/details", but displayed on the root Navigator by
            /// specifying [parentNavigatorKey]. This will cover both screen B
            /// and the application shell.
            GoRoute(
              path: ':id',
              name: 'DetailMycart',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return DetailsScreen(
                    id: int.tryParse(state.params['id'] ?? ''));
              },
            ),
          ],
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const ScreenProfile(),
            transitionDuration: const Duration(seconds: 2),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          ),
          // builder: (BuildContext context, GoRouterState state) {
          //   return const ScreenWishlist();
          // },
          routes: <RouteBase>[
            /// Same as "/a/details", but displayed on the root Navigator by
            /// specifying [parentNavigatorKey]. This will cover both screen B
            /// and the application shell.
            GoRoute(
              path: ':id',
              name: 'DetailProfile',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return DetailsScreen(
                    id: int.tryParse(state.params['id'] ?? ''));
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
