import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AppController extends GetxController {
  calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/book')) {
      return 0;
    }
    if (location.startsWith('/wishlist')) {
      return 1;
    }
    if (location.startsWith('/mycart')) {
      return 2;
    }
    if (location.startsWith('/profile')) {
      return 3;
    }
    return 0;
  }

  onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/book');
        break;
      case 1:
        GoRouter.of(context).go('/wishlist');
        break;
      case 2:
        GoRouter.of(context).go('/mycart');
        break;
      case 3:
        GoRouter.of(context).go('/profile');
        break;
    }
  }
}
