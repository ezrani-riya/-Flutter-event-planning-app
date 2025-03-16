import 'package:flutter/material.dart';
import '../models/event.dart';
import '../models/payment.dart';

class PaymentTrackingScreen extends StatelessWidget {
  final Event event;

  PaymentTrackingScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Track Payments')),
      body: ListView.builder(
        itemCount: event.payments.length,
        itemBuilder: (ctx, i) {
          final payment = event.payments[i];
          return ListTile(
            title: Text('Amount: \$${payment.amount.toStringAsFixed(2)}'),
            subtitle: Text('Date: ${payment.date.toString()}'),
            trailing: Text('Status: ${payment.status}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add payment functionality
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
