import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    this.id,
    Key? key,
  }) : super(key: key);

  final int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              id != null ? 'Details for$id' : '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Center(
              child: Link(
                uri: Uri.parse('/book'),
                builder: (context, follow) => InkWell(
                  onTap: follow,
                  child: const Text("Go to Book page"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
