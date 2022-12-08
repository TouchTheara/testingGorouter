import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helper/deeplink.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Profile Screen'),
            TextButton(
              onPressed: () {
                context.go('/profile/0');
                FirebaseDynamicLinkHelper.createDynamicLink(
                    path: '/profile/555');
              },
              child: const Text('View Setting'),
            ),
          ],
        ),
      ),
    );
  }
}
