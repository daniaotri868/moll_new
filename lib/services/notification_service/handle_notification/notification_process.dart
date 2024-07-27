// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:abo_hamdy/common/enums/order_status.dart';
// import 'package:abo_hamdy/feature/notification/presentation/page/notification.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import '../../../app.dart';
// import '../../../router/router.dart';
// import 'local_notification_service.dart';
// import 'package:abo_hamdy/firebase_options.dart';
//
// class NotificationProcess {
//   static NotificationProcess? _instance;
//
//   NotificationProcess._singleton();
//
//   factory NotificationProcess() =>
//       _instance ??= NotificationProcess._singleton();
//
//   handleNotificationForLocal(String? payload) async {
//     if (payload != null) {
//
//       // LocalNotificationService().showNotificationWithPayload(message: RemoteMessage(data: {"title":'We are inside the function :('}) );
//      await appRouter.push("/Home/Notification");
//     }
//   }
//
//   Future<String> get fcmToken async =>
//       await FirebaseMessaging.instance.getToken() ?? '';
//
//   void onMessage(
//       {required Function(String orderId, OrderStatus orderStatus)
//           onSuccess}) async {
//     FirebaseMessaging.onMessage.listen((event) {
//       print("event.notification.body ${event.notification?.body}");
//       print("event.notification.title ${event.notification?.title}");
//       print("event.data ${event.data["id"]}");
//       // App.navKey.currentState?.push(
//       //   MaterialPageRoute(builder: (context) {
//       //     print('////////////////////////////');
//       //     return NotificationPage();
//       //   }),
//       // );
// if(event.data["id"]==null){
// }
// else{
//   print(event.data);
//       onSuccess(event.data["id"],
//           OrderStatus.values[int.parse(event.data["status"]) - 1]);}
//
//       LocalNotificationService().showNotificationWithPayload(message: event);
//     });
//
//   }
//
//   void onRefreshToken({required Function(String fcmToken) onRefresh}) {
//     FirebaseMessaging.instance.onTokenRefresh.listen(onRefresh);
//   }
//
//   Future<void> _setForegroundNotificationPresentationOptions() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//             alert: true, badge: true, sound: true);
//   }
//
//   requestPermission() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//   }
//
//   Future<void> _setupInteractedMessage() async {
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//
//     if (initialMessage != null) {
//       handleNotificationForLocal(json.encode(initialMessage.data));
//     }
//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       print("event.notification.body ${event.notification?.body}");
//       print("event.notification.title ${event.notification?.title}");
//       print("event.data ${event.data.toString()}");
//       handleNotificationForLocal(json.encode(event.data));
//     });
//   }
//
//   Future<void> deleteToken() async {
//     await FirebaseMessaging.instance.deleteToken();
//   }
//
//   handleTappedNotificationOnTerminatedState() async {
//     NotificationAppLaunchDetails? details = await LocalNotificationService
//         .localNotificationPlugin
//         .getNotificationAppLaunchDetails();
//     if (details != null) {
//       if (details.didNotificationLaunchApp) {
//         handleNotificationForLocal(details.notificationResponse?.payload);
//       }
//     }
//   }
//
//   Future<void> init() async {
//     try {
//       await Firebase.initializeApp(
//           options: DefaultFirebaseOptions.currentPlatform);
//       await requestPermission();
//       if (Platform.isAndroid) {
//         FlutterLocalNotificationsPlugin().resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>();
//       }
//       log("FCM_TOKEN: ${await fcmToken}");
//       await LocalNotificationService.initialize();
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
