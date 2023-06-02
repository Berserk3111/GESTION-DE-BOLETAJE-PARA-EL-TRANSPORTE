import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmationPage extends StatelessWidget {
  final List<int> selectedSeats;
  final String name;
  final String email;

  ConfirmationPage(this.selectedSeats, this.name, this.email);

  void _launchURL() async {
    String paymentURL = 'https://example.com/payment'; // URL de pago real

    if (await canLaunch(paymentURL)) {
      await launch(paymentURL);
    } else {
      throw 'Could not launch $paymentURL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selected Seats:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(selectedSeats.join(', ')),
            SizedBox(height: 16),
            Text(
              'Passenger Name:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(name),
            SizedBox(height: 16),
            Text(
              'Passenger Email:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(email),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Payment Confirmation'),
                      content: Text('Do you want to proceed with the payment?'),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Pay'),
                          onPressed: () {
                            _launchURL();
                            Navigator.of(context).pop();
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Payment Success'),
                                  content: Text('Payment has been successful.'),
                                  actions: [
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Pago'),
            ),
          ],
        ),
      ),
    );
  }
}
