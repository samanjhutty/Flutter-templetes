import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:push_notifications/firebase/firebase_api.dart';
import 'package:push_notifications/notification.dart';
import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // For Firebase Push Notifications
  FirebaseApi().initNotification();

  // For Local Notifications
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'clickNoti',
            channelName: 'Click Notofication',
            channelDescription: 'Notification opou on click')
      ],
      debug: true);
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const MyHomePage(),
        '/notifications': (context) => const PushNotifications()
      },
      navigatorKey: navigatorKey,
      title: 'Notifcations',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Push Notofications';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // For Firebase Push Notifications
    FirebaseApi().onOpen();

    // For Local Notifications
    AwesomeNotifications().isNotificationAllowed().then((value) {
      if (!value) {
        // Checking if notifications are allowed
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const SizedBox(),
              const Text(
                'Push notifications will automatically open when clicked',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: scheme.primary,
                            foregroundColor: scheme.onPrimary,
                            shape: const RoundedRectangleBorder(),
                            padding: const EdgeInsets.symmetric(
                              vertical: 24,
                            )),
                        onPressed: () {
                          AwesomeNotifications().createNotification(
                              content: NotificationContent(
                                  id: 1,
                                  channelKey: 'clickNoti',
                                  title: 'Local Notifications',
                                  body: 'Notification body'));
                        },
                        child: const Text('Local Notification')),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
