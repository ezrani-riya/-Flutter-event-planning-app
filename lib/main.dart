import 'package:event_planning_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'providers/user_provider.dart';
import 'providers/event_provider.dart';
import 'screens/login_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize notifications
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => EventProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Planning App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: LoginScreen(),
    );
  }
}

// Function to schedule notifications for upcoming events
Future<void> scheduleNotification(Event event) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'event_channel',
        'Event Notifications',
        importance: Importance.max,
        priority: Priority.high,
      );
  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.schedule(
    0,
    'Upcoming Event: ${event.title}',
    'Your event is coming up on ${event.date.toString()}',
    event.date.subtract(Duration(hours: 1)), // Notify 1 hour before the event
    platformChannelSpecifics,
  );
}

extension on FlutterLocalNotificationsPlugin {
  schedule(
    int i,
    String s,
    String t,
    DateTime subtract,
    NotificationDetails platformChannelSpecifics,
  ) {}
}
