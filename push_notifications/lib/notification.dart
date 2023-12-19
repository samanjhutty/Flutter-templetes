import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotifications extends StatefulWidget {
  const PushNotifications({super.key});

  @override
  State<PushNotifications> createState() => _PushNotificationsState();
}

class _PushNotificationsState extends State<PushNotifications> {
  @override
  Widget build(BuildContext context) {
    final message =
        ModalRoute.of(context)!.settings.arguments as RemoteMessage?;

    return Material(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
            child: message == null
                ? const Text('Something went wrong, try again')
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        message.notification!.title!,
                        style: TextStyle(
                            fontSize: 36,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 16),
                      Text(message.notification!.body!),
                    ],
                  )),
      ),
    );
  }
}
