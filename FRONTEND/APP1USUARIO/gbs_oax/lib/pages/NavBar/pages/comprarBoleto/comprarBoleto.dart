import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComprarBoleto extends StatefulWidget {
  final corrida;
  const ComprarBoleto({Key? key, required this.corrida}) : super(key: key);

  @override
  State<ComprarBoleto> createState() => _ComprarBoletoState();
}

class _ComprarBoletoState extends State<ComprarBoleto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: stepper(),
    );
  }

  AppBar getAppBar() {
    BorderRadius.circular(80);
    return AppBar(
      toolbarHeight: 150,
      elevation: 5,
      iconTheme: const IconThemeData(color: Colors.white, size: 30, weight: 10),
      flexibleSpace: Image.network(
          "https://cdn.forbes.com.mx/2020/02/Huatulco-Sectur-Oaxaca-1.jpg",
          fit: BoxFit.fill),
      backgroundColor: Colors.white,
      title: Text(
        widget.corrida["ciudad_destino"] +
            ", " +
            widget.corrida["municipio_destino"],
        style:
            GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 20),
        maxLines: 5,
      ),
    );
  }

  Widget stepper() {
    int _currentStep = 0;
    return Container(
      child: Stepper(
        steps: [
          Step(
              isActive: _currentStep == 0,
              title: Text('Uno'),
              content: Text('Uno')),
          Step(
              isActive: _currentStep == 1,
              title: Text('Dos'),
              content: Text('Dos')),
          Step(
              isActive: _currentStep == 2,
              title: Text('Tres'),
              content: Text('Tres')),
          Step(
              isActive: _currentStep == 3,
              title: Text('Tres'),
              content: Text('Tres'))
        ],
        onStepTapped: (int newIndex) {
          setState(() {
            _currentStep = newIndex;
          });
        },
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep != 2) {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep != 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
      ),
    );
  }
}
