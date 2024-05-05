import 'package:app/src/common_widgets/dialog/image_dialog.dart';
import 'package:app/src/common_widgets/url/link_text.dart';
import 'package:app/src/common_widgets/url/url_launcher.dart';
import 'package:app/src/utils/space.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessageInfo extends HookConsumerWidget {
  const MessageInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            const Text(
              'For more information, visit our website',
              style: TextStyle(color: Colors.grey),
            ),
            const LinkText(
              text: 'https://hep.upm.edu.my/',
              urlPath: 'https://hep.upm.edu.my/',
            ),
            const SizedBox(height: 20),
            const Text(
              'Transport Management Section\nStudent Affairs Division\nUniversiti Putra Malaysia\nCancellory Putra\'s Building\n43400 UPM Serdang\nSelangor Darul Ehsan',
              style: TextStyle(
                fontSize: 12,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 20),
            MessageButtons(buttons: [
              MessageButton(
                  onPressed: () {
                    ImageDialog.of(context)
                        .showImageAssetDialog('assets/images/transit_map.png');
                  },
                  title: "UPM Transit Map"),
              MessageButton(
                  onPressed: () {
                    UrlLauncher.of(context).launch(
                        'https://sgs.upm.edu.my/upload/dokumen/20221013173417JADUAL_MASA_PERKHIDMATAN_BAS_(2022).pdf');
                  },
                  title: "Bus Schedule"),
              MessageButton(
                  onPressed: () {
                    UrlLauncher.of(context).launchUrl(Uri(
                      scheme: 'mailto',
                      path: 'bhep@upm.edu.my',
                      query: Uri.encodeFull(
                          'subject=UPM Bus Feedback&body=Name of Informant:\n'
                          'Incident Date:\n'
                          'Incident Time:\n'
                          'Bus Route:\n'
                          'Bus Plate No.:\n'
                          'Bus Stop:\n'
                          'Details:\n'),
                    ));
                  },
                  title: "Send Feedback")
            ], gap: 10.0)
          ],
        ));
  }
}

class MessageButtons extends HookConsumerWidget {
  const MessageButtons({super.key, required this.gap, required this.buttons});

  final List<MessageButton> buttons;
  final double gap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: space(height: gap, width: 0, children: buttons),
      ),
    );
  }
}

class MessageButton extends HookConsumerWidget {
  const MessageButton(
      {super.key, required this.onPressed, required this.title});

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold), // Adjusted font size
      ),
    );
  }
}
