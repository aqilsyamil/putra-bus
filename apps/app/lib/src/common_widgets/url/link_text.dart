import 'package:app/src/common_widgets/url/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LinkText extends HookConsumerWidget {
  const LinkText({
    super.key,
    required this.text,
    required this.urlPath,
  });

  final String urlPath;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        UrlLauncher url = UrlLauncher(Uri.parse(urlPath));
        url.launch(context);
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
