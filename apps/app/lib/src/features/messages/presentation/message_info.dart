import 'package:app/src/utils/space.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

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
          InkWell(
            onTap: () async {
              final Uri url = Uri(path: 'https://hep.upm.edu.my/');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Could not launch $url'),
                  ),
                );
              }
            },
            child: const Text(
              'https://hep.upm.edu.my/',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
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
                  _showTransitMap(context);
                },
                title: "UPM Transit Map"),
            MessageButton(
                onPressed: () {
                  _launchBusScheduleURL();
                },
                title: "Bus Schedule"),
            MessageButton(
                onPressed: () {
                  _launchFeedbackEmail();
                },
                title: "Send Feedback")
          ], gap: 10.0)
        ],
      ),
    );
  }

  void _showTransitMap(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black, // Black and opaque background
      builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            Center(
              // Center the InteractiveViewer
              child: InteractiveViewer(
                panEnabled: false, // Disable panning
                boundaryMargin: const EdgeInsets.all(20),
                minScale: 0.5,
                maxScale: 4,
                child: Image.asset(
                  'assets/images/transit_map.png',
                  fit: BoxFit.contain, // Ensure the entire image is visible
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

// Method to launch Bus.dart Schedule URL
  Future<void> _launchBusScheduleURL() async {
    final Uri url = Uri(
        path:
            'https://sgs.upm.edu.my/upload/dokumen/20221013173417JADUAL_MASA_PERKHIDMATAN_BAS_(2022).pdf');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not launch $url');
    }
  }

  Future<void> _launchFeedbackEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'bhep@upm.edu.my',
      query: Uri.encodeFull('subject=UPM Bus Feedback&body=Name of Informant:\n'
          'Incident Date:\n'
          'Incident Time:\n'
          'Bus Route:\n'
          'Bus Plate No.:\n'
          'Bus Stop:\n'
          'Details:\n'),
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      print('Could not launch $emailLaunchUri');
    }
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
