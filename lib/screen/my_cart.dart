import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helper/deeplink.dart';

class ScreenMycart extends StatelessWidget {
  const ScreenMycart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('My cart Screen'),
            TextButton(
              onPressed: () async {
                context.go('/mycart/0');
                final shortLink =
                    await FirebaseDynamicLinkHelper.createDynamicLink(
                        path: 'mycart/555', title: 'Test Link:', image: '');
                debugPrint("Short LInK: $shortLink");
              },
              child: const Text('View My Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
