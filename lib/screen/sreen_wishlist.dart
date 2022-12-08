import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helper/deeplink.dart';

class ScreenWishlist extends StatelessWidget {
  const ScreenWishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Wishlist Screen'),
            TextButton(
              onPressed: () {
                context.go('/wishlist/0');
                FirebaseDynamicLinkHelper.createDynamicLink(
                    path: '/wishlist/555');
              },
              child: const Text('View Wishlist'),
            ),
          ],
        ),
      ),
    );
  }
}
