import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var nombreController = TextEditingController();
var emailController = TextEditingController();

GlobalKey<FormState> keyForm = GlobalKey();

class Card_Boleto extends StatefulWidget {
  final asiento;
  const Card_Boleto({super.key, this.asiento});

  @override
  State<Card_Boleto> createState() => _Card_Boleto();
}

class _Card_Boleto extends State<Card_Boleto> {
  String name = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(3.5),
            child: SizedBox(
                width: 250,
                height: 300,
                child: Card(
                    clipBehavior: Clip.hardEdge,
                    elevation: 5,
                    color: Colors.grey.shade900,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    shadowColor: Colors.grey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Column(children: <Widget>[
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(25.5),
                              child: Text(
                                'Nombre',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(15),
                              child: TextFormField(
                                  controller: nombreController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 1.5, horizontal: 8),
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
                                    if (value!.isNotEmpty) {
                                      return "El nombre es necesario";
                                    } else if (!regExp.hasMatch(value)) {
                                      return "El nombre debe de ser a-z y A-Z";
                                    }
                                    return null;
                                  }),
                            )),
                          ]),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(25.5),
                              child: Text(
                                'Email',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(15),
                              child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 1.5, horizontal: 8),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none),
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: "Introduce tu email",
                                  ),
                                  validator: (value) {
                                    String pattern = r'(^[a-zA-Z ]*$)';
                                    RegExp regExp = RegExp(pattern);
                                    if (value!.isNotEmpty) {
                                      return "El nombre es necesario";
                                    } else if (!regExp.hasMatch(value)) {
                                      return "El nombre debe de ser a-z y A-Z";
                                    }
                                    return null;
                                  }),
                            )),
                          ]),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(25.5),
                              child: Text(
                                'Asiento',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                widget.asiento.toString(),
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            )),
                          ])
                    ])))));
  }
}
