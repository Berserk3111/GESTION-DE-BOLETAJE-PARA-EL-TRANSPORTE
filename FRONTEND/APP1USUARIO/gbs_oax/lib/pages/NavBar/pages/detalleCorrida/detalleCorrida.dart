import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/comprarBoleto/comprarBoleto.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

final numberFormat = NumberFormat.currency(locale: 'es_MX', symbol: "\$");

class DetalleCorrida extends StatefulWidget {
  final corrida;
  const DetalleCorrida({Key? key, required this.corrida}) : super(key: key);

  @override
  State<DetalleCorrida> createState() => _DetalleCorridaState();
}

class _DetalleCorridaState extends State<DetalleCorrida> {
  @override
  Widget build(BuildContext context) {
    print(widget.corrida);
    return Scaffold(
      appBar: getAppBar(),
      body: getHome(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        label: Icon(Icons.favorite_outline_outlined),
        backgroundColor: Colors.pink,
      ),
      bottomNavigationBar: getBottomButton(context),
    );
  }

  Container getBottomButton(BuildContext context) {
    BorderRadius.circular(50);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 10,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)))),
            child: const Text('Comprar'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ComprarBoleto(corrida: widget.corrida)));
            }),
      ),
    );
  }

  AppBar getAppBar() {
    BorderRadius.circular(80);
    return AppBar(
      toolbarHeight: 150,
      elevation: 5,
      iconTheme: IconThemeData(color: Colors.white, size: 30, weight: 10),
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

  Widget getHome() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(('Origen: ') + widget.corrida['municipio_origen'],
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.orange)),
            Text(('Destino: ') + widget.corrida['municipio_destino'],
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.orange)),
            Text(
              ('Fecha: ') + widget.corrida['fecha'].toString(),
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            Text(
              ('Hora: ') + widget.corrida['hora'].toString(),
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            Text(
              ('Asientos totales: ') +
                  widget.corrida['unidadModel']['asientos_totales'].toString(),
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            Text(
              ('Asientos disponibles: '),
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            Text(
              ('Precio: ') +
                  numberFormat.format(widget.corrida['costosModel']['costo']),
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
