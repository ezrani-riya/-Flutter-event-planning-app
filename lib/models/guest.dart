class Guest {
  final String id;
  final String name;
  final String email;
  String response; // Attending, Not Attending, Maybe
  bool hasPaid;

  Guest({
    required this.id,
    required this.name,
    required this.email,
    this.response = 'Pending',
    this.hasPaid = false,
  });
}
