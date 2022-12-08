import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helper/deeplink.dart';

class ScreenBook extends StatelessWidget {
  const ScreenBook({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Book Screen'),
            TextButton(
              onPressed: () {
                context.go('/book/0');
                FirebaseDynamicLinkHelper.createDynamicLink(path: '/book/555');
              },
              child: const Text('View Book details'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/profile');
              },
              child: const Text('go to screen profile'),
            ),
          ],
        ),
      ),
    );
  }
}
