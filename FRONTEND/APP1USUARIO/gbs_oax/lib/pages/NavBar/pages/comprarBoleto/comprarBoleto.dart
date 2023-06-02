import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/comprarBoleto/procesoBoleto.dart';
import 'package:url_launcher/url_launcher.dart';

class ComprarBoleto extends StatefulWidget {
  final corrida;
  const ComprarBoleto({Key? key, required this.corrida}) : super(key: key);

  @override
  State<ComprarBoleto> createState() => _ComprarBoleto();
}

class _ComprarBoleto extends State<ComprarBoleto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SeatSelectionPage(
        corrida: widget.corrida,
      ),
    );
  }
}
