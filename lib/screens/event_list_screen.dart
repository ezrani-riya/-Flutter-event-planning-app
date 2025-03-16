import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/event.dart';
import '../providers/event_provider.dart';
import 'event_creation_screen.dart';
import 'event_details_screen.dart';

class EventListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    final events = eventProvider.events;

    return Scaffold(
      appBar: AppBar(title: Text('Event List')),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder:
            (ctx, i) => ListTile(
              title: Text(events[i].title),
              subtitle: Text(events[i].date.toString()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetailsScreen(event: events[i]),
                  ),
                );
              },
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventCreationScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
