import 'package:flutter/material.dart';
import '../models/event.dart';
import 'guest_management_screen.dart';
import 'payment_tracking_screen.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  EventDetailsScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${event.description}'),
            Text('Date: ${event.date.toString()}'),
            Text('Location: ${event.location}'),
            Text('Category: ${event.category}'),
            Text('Visibility: ${event.visibility}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GuestManagementScreen(event: event),
                  ),
                );
              },
              child: Text('Manage Guests'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentTrackingScreen(event: event),
                  ),
                );
              },
              child: Text('Track Payments'),
            ),
          ],
        ),
      ),
    );
  }
}
