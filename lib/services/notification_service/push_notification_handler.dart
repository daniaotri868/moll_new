import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../core/api/api_utils.dart';

class PushNotificationsHandler {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    // description
    importance: Importance.high,
  );






  static Future<void> showNotificationWithPayload(
      {required RemoteMessage message}) async {
    try {
      await flutterLocalNotificationsPlugin.show(
        message.notification.hashCode,
        message.notification?.title ?? '',
        message.notification?.body ?? "",
        NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              priority: Priority.high,

              importance: Importance.high,
              channelDescription: channel.description,
              icon: "@mipmap/ic_launcher", //Your app icon goes here
              // other properties...
            ),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            )),
        payload: json.encode(message.data),
      );
    } catch (e) {
      showMessage(e.toString());
    }
  }

  static requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  static void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id $id ,title $title,body $body,payload $payload');
  }

  static handleNotificationForLocal({required Map<String, dynamic> payload}) {
    if (payload.isEmpty) {

      print("payload isEmpty===========================");
      // appRouter.pushNamed(NotificationPage.name);
    } else if (payload['type'] == 'order') {
      print("OrderDetailsPage==========================");
      // appRouter.pushNamed(OrderDetailsPage.name, extra: payload['id']);
    }
  }

  static _onSelectNotification(NotificationResponse notificationResponse) {
    print("onselecttttttttttttttttttttttttttttttt");
    print("${notificationResponse.payload}=================================");

    if (notificationResponse.payload != null) {
      print(
          "${notificationResponse.payload}+++++++++++++++++++++++++++++++++++++");
      var data =
          json.decode(notificationResponse.payload!).cast<String, dynamic>();
      print(
          "${data}+++++++++++++++++++++++++++++++++++++");
      handleNotificationForLocal(payload: data);
    } else {
      print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
      handleNotificationForLocal(payload: {});
    }
  }

  Future<RemoteMessage?> setupInteractedMessage() async {
    print("setupInteractedMessage=================================");
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      print("background===============================");
      handleNotificationForLocal(payload: initialMessage.data);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("foreground===============================");
      handleNotificationForLocal(payload: message.data);
    });
    return initialMessage;
  }

  Future<void> init() async {
    try {
      await requestPermission();

      ///Configure notification permissions
      //IOS
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true, // Required to display a heads up notification
        badge: true,
        sound: true,
      );
      if (Platform.isAndroid) {
        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.createNotificationChannel(channel);
      }

      const AndroidInitializationSettings androidInitializationSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      DarwinInitializationSettings iosInitializationSettings =
          DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      );

      final InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: iosInitializationSettings,
      );

      await flutterLocalNotificationsPlugin.initialize(
        settings,
        onDidReceiveNotificationResponse: _onSelectNotification,
      );
    } catch (e) {
      rethrow;
    }
  }

  ///Listen to messages in Foreground

  void onMessage(
      {required Function(String orderId)
          onSuccess}) async {
    print("onmessageeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("event.notification.body ${message.notification?.body}");
      print("event.notification.title ${message.notification?.title}");
      print("event.data ${message.data["id"]}");
      print(message.data);
      if (message.data["id"] == null) {
        print("lllllllllllllllllllllllllllllll");
      } else {
        print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
        print(message.data);
        // onSuccess(message.data["id"],
        //     OrderStatus.values[int.parse(message.data["status"]) - 1]);
      }

      showNotificationWithPayload(message: message);
    });
  }

  //Get the message from tapping on the notification when app is not in foreground

  Future<RemoteMessage?> get fcmInitialMessage async =>
      await FirebaseMessaging.instance.getInitialMessage();

  Future<String> get fcmToken async =>
      await FirebaseMessaging.instance.getToken() ?? '';

  void onRefreshToken({required Function(String fcmToken) onRefresh}) {
    FirebaseMessaging.instance.onTokenRefresh.listen(onRefresh);
  }

  Future<void> deleteToken() async {
    await FirebaseMessaging.instance.deleteToken();
  }
}
