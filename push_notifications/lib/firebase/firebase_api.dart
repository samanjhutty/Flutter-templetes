import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_notifications/main.dart';

class FirebaseApi {
  FirebaseMessaging fbMessaging = FirebaseMessaging.instance;
  String? token;
  final vapidKey =
      'BKoqXaEgvZ9IjDeXw-_ApDrNEqFluETw4Et1xSbGCY0V7M5lmwlVmkPOet-i5vT_bB7c0nExItFgVTymRzXvwns';

  // Function to initialize FB messaging
  Future<void> initNotification() async {
    // Permission to display notifications
    fbMessaging.requestPermission();

    token = await fbMessaging.getToken(vapidKey: vapidKey);
    print('Tokken:: $token');

    initPushNotifications();
  }

  // Function to handle recieved message
  void handleMessages(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState?.pushNamed('/notifications', arguments: message);
  }

  // Function to initialize background settings
  Future initPushNotifications() async {
    // If the app was terminated
    fbMessaging.getInitialMessage().then(handleMessages);
    FirebaseMessaging.onMessage.listen(handleMessages);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
  }
}
