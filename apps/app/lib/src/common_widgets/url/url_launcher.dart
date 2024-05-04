import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  UrlLauncher(this.url);

  final Uri url;

  Future<void> launch(BuildContext context) async {
    if (!await launchUrl(url)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch ${url.toString()}'),
          ),
        );
      }
      throw 'Could not launch ${url.toString}';
    }
  }
}
