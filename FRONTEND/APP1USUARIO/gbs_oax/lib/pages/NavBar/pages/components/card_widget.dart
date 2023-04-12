import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/detalleCorrida/detalleCorrida.dart';
import 'package:google_fonts/google_fonts.dart';

class card_vertical extends StatefulWidget {
  final corrida;
  const card_vertical({Key? key, required this.corrida}) : super(key: key);

  @override
  State<card_vertical> createState() => _card_verticalState();
}

class _card_verticalState extends State<card_vertical> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 250,
        child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 5,
            color: Colors.grey.shade900,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            shadowColor: Colors.grey,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: InkWell(
                splashColor: Colors.grey.shade800,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetalleCorrida(corrida: widget.corrida)));
                },
                child: Column(
                  children: [
                    const Image(
                      image: const NetworkImage(
                          "https://cdn.forbes.com.mx/2020/02/Huatulco-Sectur-Oaxaca-1.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 9.0),
                      child: Column(
                        children: [
                          Center(
                              child: Text(
                            widget.corrida['ciudad_destino'],
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          )),
                          Center(
                              child: Text(
                            widget.corrida['municipio_destino'],
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          )),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Center(
                                child: Text('Mas info',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.orange))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
