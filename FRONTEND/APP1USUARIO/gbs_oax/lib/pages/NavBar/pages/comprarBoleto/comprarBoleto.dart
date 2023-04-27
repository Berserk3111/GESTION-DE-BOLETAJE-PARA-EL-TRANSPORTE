import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

GlobalKey<FormState> keyForm = GlobalKey();

class ComprarBoleto extends StatefulWidget {
  final corrida;
  const ComprarBoleto({Key? key, required this.corrida}) : super(key: key);

  @override
  State<ComprarBoleto> createState() => _ComprarBoletoState();
}

int activeStep = 0;
final bool isSelected = true;

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
      child: Column(children: [stepper(), getStep()]),
    );
  }

  Widget getStep() {
    if (activeStep == 0) {
      return Text("step1");
    }
    if (activeStep == 1) {
      return Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
              width: double.maxFinite,
              height: 200,
              child: Card(
                  elevation: 10,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Form(
                    key: keyForm,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(15.5),
                              child: Text(
                                'Nombre',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: "Introduce tu nombre",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(15.5),
                              child: Text(
                                'Apellido',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: "Introduce tu apellido",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                '¿Donde abordaras la unidad?',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                              width: 15,
                              decoration: BoxDecoration(
                                color:
                                    isSelected ? Colors.blueGrey : Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Prueba'),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      'data',
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.blueGrey
                                            : Colors.blue,
                                      ),
                                    )
                                  ]),
                            ))
                          ],
                        )
                      ],
                    ),
                  ))));
    }
    if (activeStep == 2) {
      return Text("step3");
    }
    if (activeStep == 3) {
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
        ),
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
