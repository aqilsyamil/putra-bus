import 'package:app/src/common_widgets/bar/app_bar.dart';
import 'package:app/src/common_widgets/list_items_builder.dart';
import 'package:app/src/features/messages/application/messages_service.dart';
import 'package:app/src/features/messages/domain/message.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';

class MessagesScreen extends HookConsumerWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Messages'), // Custom app bar
      body: Column(children: <Widget>[
        SizedBox(
          height: 300.0,
          child: Consumer(builder: (context, ref, child) {
            final messages = ref.watch(messagesServiceProvider);

            return ListItemsBuilder<Message>(
              data: messages,
              itemBuilder: (context, model) => MessageListTile(
                title: model.title,
                message: model.message,
                dateTime: model.dateTime,
              ),
            );
          }),
        ),
        Padding(
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
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xFF00D161),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12), // Adjusted padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {
                              _showTransitMap(context);
                            },
                            child: const Text(
                              'UPM Transit Map',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                      FontWeight.bold), // Adjusted font size
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  const Color.fromARGB(255, 11, 12, 12),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12), // Adjusted padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: _launchBusScheduleURL,
                            child: const Text(
                              'Bus Schedule',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                      FontWeight.bold), // Adjusted font size
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xFF00D161),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12), // Adjusted padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: _launchFeedbackEmail,
                            child: const Text(
                              'Feedback',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                      FontWeight.bold), // Adjusted font size
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
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
          'https://hep.upm.edu.my/perkhidmatan_utama/seksyen_pengurusan_kenderaan/jadual_perkhidmatan_bas_kampus_upm-63338?L=en');
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

class MessageListTile extends StatelessWidget {
  const MessageListTile(
      {super.key,
      required this.title,
      required this.message,
      required this.dateTime});

  final String title;
  final String message;
  final IconData icon = Icons.message;
  final Color color = Colors.red;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: (Colors.red[800])!, width: 2.0),
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Card(
            margin: EdgeInsets.zero,
            color: Colors.white,
            child: ListTile(
                leading: Icon(icon, color: color),
                title: Text(
                  title,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(message),
                trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(Jiffy.parse(dateTime.toString()).fromNow()),
                      Text(DateFormat('hh:mm a').format(dateTime))
                    ]))));
  }
}
