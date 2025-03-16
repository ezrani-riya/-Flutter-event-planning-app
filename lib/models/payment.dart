class Payment {
  final String id;
  final String guestId;
  final double amount;
  final DateTime date;
  final String status; // Pending, Completed, Failed

  Payment({
    required this.id,
    required this.guestId,
    required this.amount,
    required this.date,
    this.status = 'Pending',
  });
}
