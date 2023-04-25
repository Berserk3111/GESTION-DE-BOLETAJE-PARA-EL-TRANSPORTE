import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class ComprarBoleto extends StatefulWidget {
  final corrida;
  const ComprarBoleto({Key? key, required this.corrida}) : super(key: key);

  @override
  State<ComprarBoleto> createState() => _ComprarBoletoState();
}

  int activeStep = 0;

class _ComprarBoletoState extends State<ComprarBoleto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
        stepper(),   
        getStep()  
        ]),
    );
  }

  Widget getStep() {
    if(activeStep == 0) {
      return Text("step1");
    }
    if(activeStep == 1) {
      return Text("step2");
    }
    if(activeStep == 2) {
      return Text("step3");
    }
    if(activeStep == 3) {
      return Text("step4");
    } else {
      return Text("nada");
    }
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
    return EasyStepper(
      activeStep: activeStep,
      padding: EdgeInsetsDirectional.all(20),
      lineLength: 70,
      lineSpace: 10,
      lineType: LineType.normal,
      defaultLineColor: Colors.black,
      finishedLineColor: Colors.orange,
      activeStepTextColor: Colors.orange,
      finishedStepTextColor: Colors.orange,
      internalPadding: 0,
      showLoadingAnimation: false,
      stepRadius: 15,
      showStepBorder: false,
      lineDotRadius: 1.5,
      steps: [
        EasyStep(
            customStep: CircleAvatar(
              radius: 20,
              backgroundColor: activeStep >= 0 ? Colors.orange : Colors.black,
              child: Icon(
                Icons.chair_alt_rounded,
                color: Colors.white,
                size: 15,
              ),
            ),
            customTitle: Text(
              'Asientos',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            customLineWidget: Text(
              'Prueba',
              style: TextStyle(color: Colors.black),
            )),
        EasyStep(
          customStep: CircleAvatar(
            radius: 20,
            backgroundColor: activeStep >= 1 ? Colors.orange : Colors.black,
            child: Icon(
              Icons.abc_rounded,
              color: Colors.white,
              size: 15,
            ),
          ),
          customTitle: Text(
            'Registro de pasajeros',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 20,
            backgroundColor: activeStep >= 2 ? Colors.orange : Colors.black,
            child: Icon(
              Icons.domain_verification_rounded,
              color: Colors.white,
              size: 15,
            ),
          ),
          customTitle: Text(
            'Validación de datos',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 20,
            backgroundColor: activeStep >= 3 ? Colors.orange : Colors.black,
            child: Icon(
              Icons.credit_card_outlined,
              color: Colors.white,
              size: 15,
            ),
          ),
          customTitle: Text(
            'Pago',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ],
      onStepReached: (index) => {
        setState(() {
          activeStep = index;
        })
      },
    );
  }
}
