// import 'dart:async';
// import 'dart:convert';
//
// import 'package:bot_toast/bot_toast.dart';
// import 'package:tracking/main.dart';
// import 'package:tracking/tracking_model.dart';
// import 'package:tracking/url.dart';
// import 'package:tracking/user.dart';
// import 'package:flutter/material.dart';
// import 'package:logging/logging.dart';
// import 'package:signalr_netcore/hub_connection.dart';
// import 'package:signalr_netcore/signalr_client.dart';
//
// //send my location
// //other locations user
// //{lat, lng, id}
//
// class SignalR {
//   HubConnection? hubConnection;
//   bool isHubInited = false;
//   bool isHubConnected = false;
//   bool isHubClosed = false;
//
//   static  StreamController<TrackingModel> messages = StreamController<TrackingModel>();
//
//   Future<void> initSignalR() async {
//     debugPrint('init signalR');
//     try {
//       Logger.root.onRecord.listen((LogRecord rec) {
//         debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
//       });
//       final hubPortLogger = Logger("SignalR - hub");
//       final transportPortLogger = Logger("SignalR - transport");
//
//       final httpOtions = HttpConnectionOptions(
//         logger: transportPortLogger,
//         requestTimeout: 15000,
//         skipNegotiation: true,
//         transport: HttpTransportType.WebSockets,
//         accessTokenFactory: () async => User.fromJson(jsonDecode(shared.getString("userKey")!)).accessToken,
//       );
//
//       hubConnection = HubConnectionBuilder()
//           .withUrl('${AppUrl.baseUrl}Hub/Tracing', options: httpOtions)
//           .withAutomaticReconnect(retryDelays: [200, 3000, 5000, 7000])
//           .configureLogging(hubPortLogger)
//           .build();
//
//       hubConnection!.onclose(({error}) {
//         debugPrint('hubConnection Closed');
//         isHubInited = false;
//         isHubConnected = false;
//         isHubClosed = true;
//       });
//       hubConnection!.onreconnected(({connectionId}) {
//         isHubConnected = true;
//         isHubClosed = false;
//       });
//       hubConnection!.onreconnecting(({error}) {
//         isHubConnected = false;
//       });
//
//       isHubInited = hubConnection != null;
//       isHubConnected = true;
//
//       getMessage();
//     } catch (e, s) {
//       debugPrint(e.toString());
//       debugPrint(s.toString());
//     }
//   }
//
//   Future<void> openConnection([int? value]) async {
//     debugPrint('open connection');
//     try {
//       if (isHubInited) {
//         await hubConnection!.start()?.then((value) => debugPrint('its connect fine}'));
//         // await hubConnection!.invoke('Receive', args: []);
//       } else {
//         await initSignalR().then((value) => hubConnection!.start());
//         // await hubConnection!.invoke('Receive', args: []);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   Future<void> closeConnection({bool initOnlyLocationTrack = false}) async {
//     try {
//       if (isHubInited) {
//         await hubConnection!.stop();
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   void getMessage() async {
//     if (isHubInited) {
//       debugPrint("hub is inited");
//       hubConnection!.on(
//         "ServerToClient",
//         (arguments) {
//           print('this is arg $arguments');
//           if (arguments != null) {
//             messages.add(TrackingModel(
//               id: (arguments[0] as Map)["meId"],
//               lat: double.parse("${(arguments[0] as Map)["lat"]}"),
//               lng: double.parse("${(arguments[0] as Map)["lng"]}"),
//             ));
//           }
//         },
//       );
//     } else {
//       debugPrint("hub its not inited");
//       await openConnection();
//     }
//   }
//
//   sendLocationToServer(TrackingModel data) async {
//     print("sended data ${data.id} ${data.lat} ${data.lng}}");
//     if (isHubInited) {
//       debugPrint("hub is inited");
//       hubConnection!.invoke(
//         "ClientToServer",
//         args: [data.toMap()],
//       );
//     } else {
//       debugPrint("hub its not inited");
//       await openConnection();
//     }
//   }
// }
