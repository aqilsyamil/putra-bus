import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UrlLauncher {
  UrlLauncher();

  static UrlLauncherState of(BuildContext context) {
    return UrlLauncherState(context);
  }
}

class UrlLauncherState {
  UrlLauncherState(this.context);

  final BuildContext context;

  Future<void> launch(String path) async {
    Uri url = Uri.parse(path);

    if (!await url_launcher.launchUrl(url)) {
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

  Future<void> launchUrl(Uri url) async {
    if (!await url_launcher.launchUrl(url)) {
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
