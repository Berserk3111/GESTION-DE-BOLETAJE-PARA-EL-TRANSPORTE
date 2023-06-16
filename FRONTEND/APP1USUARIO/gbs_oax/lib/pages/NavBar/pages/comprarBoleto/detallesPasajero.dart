import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/comprarBoleto/card_datos.dart';
import 'package:gbs_oax/pages/NavBar/pages/comprarBoleto/confirmacionPago.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:reactive_forms/reactive_forms.dart';

void _launchURL() async {
  String paymentURL = 'https://example.com/payment'; // URL de pago real

  if (await canLaunch(paymentURL)) {
    await launch(paymentURL);
  } else {
    throw 'Could not launch $paymentURL';
  }
}

class PassengerDetailsPage extends StatefulWidget {
  static String route = 'card_datos';
  final List<int> selectedSeats;

  PassengerDetailsPage(this.selectedSeats);

  @override
  _PassengerDetailsPageState createState() => _PassengerDetailsPageState();
}

class _PassengerDetailsPageState extends State<PassengerDetailsPage> {
  String nombre = "";

  String apellidos = "";

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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmación de pago'),
                      content: Text('¿Deseas continuar con el cobro?'),
                      actions: [
                        TextButton(
                          child: Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Pagar'),
                          onPressed: () {
                            _launchURL();
                            Navigator.of(context).pop();
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Pago Realizado'),
                                  content:
                                      Text('Su pago fue realizado con exito'),
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
              child: Text('Pagar boletos'),
            ),
          ],
        ),
      ),
    );
  }
}
