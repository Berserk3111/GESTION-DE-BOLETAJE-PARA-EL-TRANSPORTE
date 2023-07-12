import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/comprarBoleto/card_datos.dart';
import 'package:gbs_oax/pages/NavBar/pages/comprarBoleto/confirmacionPago.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketData {
  final String rawValue;

  TicketData(this.rawValue);
}

class PassengerDetailsPage extends StatefulWidget {
  static String route = 'card_datos';
  final selectedSeats;
  final corrida;

  const PassengerDetailsPage(
      {Key? key, required this.corrida, required this.selectedSeats})
      : super(key: key);

  @override
  _PassengerDetailsPageState createState() => _PassengerDetailsPageState();
}

class _PassengerDetailsPageState extends State<PassengerDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalles del pasajero',
          style: GoogleFonts.montserrat(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
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
                      return Card_Boleto(
                        asiento: widget.selectedSeats[index],
                        corrida: widget.corrida,
                      );
                    })),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationPage(
                      asiento: widget.selectedSeats,
                      corrida: widget.corrida,
                      data: TicketData(''),
                    ),
                  ),
                );
              },
              child: Text('Continue'),
            )
          ],
        ),
      ),
    );
  }
}
