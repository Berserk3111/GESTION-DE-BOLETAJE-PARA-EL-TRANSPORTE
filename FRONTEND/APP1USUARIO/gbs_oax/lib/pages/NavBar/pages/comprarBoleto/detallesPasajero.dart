import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/comprarBoleto/card_datos.dart';
import 'package:gbs_oax/pages/NavBar/pages/comprarBoleto/confirmacionPago.dart';
import 'package:url_launcher/url_launcher.dart';

class PassengerDetailsPage extends StatefulWidget {
  final List<int> selectedSeats;

  PassengerDetailsPage(this.selectedSeats);

  @override
  _PassengerDetailsPageState createState() => _PassengerDetailsPageState();
}

class _PassengerDetailsPageState extends State<PassengerDetailsPage> {
  String name = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del pasajero'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: widget.selectedSeats.length, //aui debe cambiarse
                    itemBuilder: (_, int index) {
                      return Card_Boleto(asiento: widget.selectedSeats[index]);
                    })),
            SizedBox(height: 50),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ConfirmationPage(widget.selectedSeats, name, email),
                  ),
                );
              },
              icon: Icon(Icons.arrow_forward_ios),
              label: Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
