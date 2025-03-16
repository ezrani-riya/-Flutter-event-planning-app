import 'package:flutter/material.dart';
import '../models/event.dart';
import '../models/guest.dart';

class GuestManagementScreen extends StatelessWidget {
  final Event event;

  GuestManagementScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Guests')),
      body: ListView.builder(
        itemCount: event.guests.length,
        itemBuilder: (ctx, i) {
          final guest = event.guests[i];
          return ListTile(
            title: Text(guest.name),
            subtitle: Text(guest.email),
            trailing: Text(guest.response),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add guest functionality
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
