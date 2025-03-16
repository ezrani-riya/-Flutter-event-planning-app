import 'package:event_planning_app/models/guest.dart';
import 'package:event_planning_app/models/payment.dart';
import 'package:flutter/material.dart';
import '../models/event.dart';

class EventProvider with ChangeNotifier {
  List<Event> _events = [];

  List<Event> get events => _events;

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }

  void addGuest(String eventId, Guest guest) {
    final event = _events.firstWhere((e) => e.id == eventId);
    event.guests.add(guest);
    notifyListeners();
  }

  void addPayment(String eventId, Payment payment) {
    final event = _events.firstWhere((e) => e.id == eventId);
    event.payments.add(payment);
    notifyListeners();
  }
}
