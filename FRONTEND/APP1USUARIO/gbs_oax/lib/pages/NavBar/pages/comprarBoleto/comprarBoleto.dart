// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:gbs_oax/models/asientosModel.dart';
import 'package:gbs_oax/pages/NavBar/pages/components/asientos.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey<FormState> keyForm = GlobalKey();

class ComprarBoleto extends StatefulWidget {
  final corrida;
  const ComprarBoleto({Key? key, required this.corrida}) : super(key: key);

  @override
  State<ComprarBoleto> createState() => _ComprarBoletoState();
}

int activeStep = 0;
int reachedStep = 0;
int activeStep2 = 0;
int upperBound = 4;

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
    final size = MediaQuery.of(context).size;
    if (activeStep2 == 0) {
      return Padding(
          padding: EdgeInsets.all(25.0),
          child: SizedBox(
            child: Container(
              child: Column(children: <Widget>[
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2.5),
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                                AsientoModel.listChairs.length,
                                (i) => SeatRow(
                                      numSeats:
                                          AsientoModel.listChairs[i].seats,
                                      freeSeats:
                                          AsientoModel.listChairs[i].freeSeats,
                                      rowSeats:
                                          AsientoModel.listChairs[i].rowSeats,
                                    )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    'Selecciona tus asientos',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(10)),
                                Center(
                                  child: Text(
                                    'Asientos totales: ${widget.corrida['unidadModel']['asientos_totales'].toString()}',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ])
              ]),
            ),
          ));
    }
    if (activeStep2 == 1) {
      return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
              width: double.maxFinite,
              height: 260,
              child: Card(
                  elevation: 10,
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
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
                              padding: const EdgeInsets.all(20.5),
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
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none),
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: "Introduce tu nombre",
                                  ),
                                  validator: (value) {
                                    String pattern = r'(^[a-zA-Z ]*$)';
                                    RegExp regExp = RegExp(pattern);
                                    if (value!.isEmpty) {
                                      return "El nombre es necesario";
                                    } else if (!regExp.hasMatch(value)) {
                                      return "El nombre debe de ser a-z y A-Z";
                                    }
                                    return null;
                                  }),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.5),
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
                                  contentPadding: const EdgeInsets.symmetric(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.5),
                              child: Text(
                                'Lugar de origen: ',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  '${widget.corrida['municipio_origen']}',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.orange),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.5),
                              child: Text(
                                'Lugar de destino: ',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  '${widget.corrida['municipio_destino']}',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.orange),
                                ),
                              ),
                            )
                          ],
                        ),
                        /* Row(
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
                                  color: isSelected
                                      ? Colors.blueGrey
                                      : Colors.white,
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
                              ),
                            ),
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
                        ) */
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

  Widget stepper() {
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 1, child: _previousStep()),
          Expanded(
            flex: 15,
            child: EasyStepper(
              activeStep: activeStep2,
              maxReachedStep: reachedStep,
              steppingEnabled: true,
              lineLength: 80,
              lineSpace: 4,
              lineType: LineType.dotted,
              activeStepBorderColor: Colors.orange,
              activeStepIconColor: Colors.orange,
              activeStepTextColor: Colors.orange,
              activeLineColor: Colors.orange,
              activeStepBackgroundColor: Colors.white,
              unreachedStepBackgroundColor: Colors.grey,
              unreachedStepBorderColor: Colors.black,
              unreachedStepIconColor: Colors.black,
              unreachedStepTextColor: Colors.black,
              unreachedLineColor: Colors.black,
              finishedStepBackgroundColor: Colors.white,
              finishedStepBorderColor: Colors.green,
              finishedStepIconColor: Colors.green,
              finishedStepTextColor: Colors.green,
              finishedLineColor: Colors.green,
              borderThickness: 10,
              internalPadding: 15,
              showLoadingAnimation: false,
              steps: [
                EasyStep(
                  finishIcon: Icon(CupertinoIcons.check_mark),
                  icon: const Icon(CupertinoIcons.bus),
                  enabled: _allowTabStepping(0),
                  customTitle: Text('Asientos',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      )),
                ),
                EasyStep(
                  icon: const Icon(CupertinoIcons.doc_plaintext),
                  finishIcon: Icon(CupertinoIcons.check_mark),
                  enabled: _allowTabStepping(1),
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
                  icon: const Icon(CupertinoIcons.cart_fill_badge_plus),
                  title: 'Checkout',
                  lineText: 'Choose Payment Method',
                  enabled: _allowTabStepping(2),
                ),
                EasyStep(
                  icon: const Icon(CupertinoIcons.money_dollar),
                  title: 'Payment',
                  lineText: 'Confirm Order Items',
                  enabled: _allowTabStepping(3),
                ),
                EasyStep(
                  icon: const Icon(Icons.file_present_rounded),
                  title: 'Order Details',
                  lineText: 'Submit Order',
                  enabled: _allowTabStepping(4),
                ),
                EasyStep(
                  icon: const Icon(Icons.check_circle_outline),
                  title: 'Finish',
                  enabled: _allowTabStepping(5),
                ),
              ],
              onStepReached: (index) => setState(() {
                activeStep2 = index;
              }),
            ),
          ),
          Expanded(flex: 1, child: _nextStep()),
        ],
      ),
    );
  }

  Widget _nextStep() {
    return IconButton(
      onPressed: () {
        if (activeStep2 < upperBound) {
          setState(() {
            ++activeStep2;
            if (reachedStep < activeStep2) {
              reachedStep = activeStep2;
            }
          });
        }
      },
      icon: const Icon(Icons.arrow_forward_ios),
    );
  }

  /// Returns the previous button.
  Widget _previousStep() {
    return IconButton(
      onPressed: () {
        if (activeStep2 > 0) {
          setState(() => --activeStep2);
        }
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }
}

bool _allowTabStepping(int index) => index <= reachedStep;
