import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

void main() {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'Basic Notifications',
      channelDescription: 'Notification channel for basic tests',
    )
  ],
  debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
            primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
@override
  void initState() {

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if(!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }

     });
    super.initState();
  }
  triggerNotification(){
AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: 10, channelKey: 'basic_channel',
      title: 'Demo Notification',
      body: 'Demo Notification',
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("noti"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ElevatedButton(onPressed: (){
          triggerNotification();
        }, child: Text("Trigger Notification"))
        ),

   );
  }
}
