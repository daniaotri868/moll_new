// import 'dart:convert';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import '../../../core/api/api_utils.dart';
// import '../models/payload_model.dart';
// import 'notification_process.dart';
//
// class LocalNotificationService {
//   static final _localNotificationPlugin = FlutterLocalNotificationsPlugin();
//
//   static FlutterLocalNotificationsPlugin get localNotificationPlugin =>
//       _localNotificationPlugin;
//
//   static Future<void> initialize() async {
//     const AndroidInitializationSettings androidInitializationSettings =
//     AndroidInitializationSettings('mipmap/launcher_icon');
//
//     DarwinInitializationSettings iosInitializationSettings =
//     const DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: false,
//       requestSoundPermission: false,
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );
//
//     final InitializationSettings settings = InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: iosInitializationSettings,
//     );
//
//     _localNotificationPlugin.resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>();
//
//     await _localNotificationPlugin.initialize(
//       settings,
//       onDidReceiveBackgroundNotificationResponse: _onSelectNotification,
//       onDidReceiveNotificationResponse: _onSelectNotification,
//     );
//   }
//
//
//
//   static void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) {
//     print('id $id ,title $title,body $body,payload $payload');
//   }
//
//   Future<void> showNotificationWithPayload(
//       {required RemoteMessage message}) async {
//     // final PayloadModel payloadModel = PayloadModel.fromJson(message.notification.body);
//
//     try {
//       await _localNotificationPlugin.show(
//         message.hashCode,
//         message.notification?.title ?? '',
//         message.notification?.body ?? "",
//         _notificationDetails(message.data['android_channel_id'], message.data['sound']),
//         payload: json.encode(message.data),
//       );
//     } catch (e) {
//       showMessage(e.toString());
//     }
//   }
//
//   static void _onSelectNotification(NotificationResponse notificationResponse) {
//     if (notificationResponse.payload != null &&
//         (notificationResponse.payload?.isNotEmpty ?? false)) {
//       NotificationProcess()
//           .handleNotificationForLocal(notificationResponse.payload);
//     }
//   }
//
//   _notificationDetails(String? channel, String? sound) {
//     AndroidNotificationDetails androidNotificationDetails =
//     AndroidNotificationDetails(
//       channel ??DateTime.now().toString(),
//       channel ??DateTime.now().toString(),
//
//       channelDescription: "all",
//       importance: Importance.max,
//       priority: Priority.max,
//       playSound: true,
//       enableVibration: true,
//       styleInformation: const BigTextStyleInformation(''),
//
//     );
//     DarwinNotificationDetails iosNotificationDetails =
//      DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//       sound: sound,
//     );
//
//     return NotificationDetails(
//         android: androidNotificationDetails, iOS: iosNotificationDetails);
//   }
//
//
// }
