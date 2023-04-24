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

  int _index = 0;

  Widget stepper() {
    int _currentStep = 0;
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 3) {
          setState(() {
            _index += 1;
            print(_index);
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: Text('Step 1 title'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: Text('Content for Step 1')),
        ),
        Step(
          title: Text('Step 2 title'),
          content: Text('Content for Step 2'),
        ),
        Step(
          title: Text('Step 3 title'),
          content: Text('Content for Step 3'),
        ),
        Step(
          title: Text('Step 4 title'),
          content: Text('Content for Step 4'),
        ),
      ],
    );
  }
}
