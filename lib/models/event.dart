import 'guest.dart';
import 'payment.dart';

class Event {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String location;
  final String category;
  final String visibility;
  final String imageUrl;
  final List<Guest> guests;
  final List<Payment> payments;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.category,
    required this.visibility,
    required this.imageUrl,
    this.guests = const [],
    this.payments = const [],
  });
}
