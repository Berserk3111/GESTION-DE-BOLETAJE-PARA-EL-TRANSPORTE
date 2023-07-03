import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbs_oax/pages/Bloc/Urban_bloc.dart';
import 'package:gbs_oax/pages/NavBar/pages/comprarBoleto/comprarBoleto.dart';
import 'package:gbs_oax/providers/boletos_provider.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

final numberFormat = NumberFormat.currency(locale: 'es_MX', symbol: "\$");

class DetalleCorrida extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final corrida;
  const DetalleCorrida({Key? key, required this.corrida}) : super(key: key);

  @override
  State<DetalleCorrida> createState() => _DetalleCorridaState();
}

class _DetalleCorridaState extends State<DetalleCorrida> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getHome(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("button");
        },
        backgroundColor: Colors.pink,
        child: const Icon(Icons.favorite_border),
      ),
      bottomNavigationBar: getBottomButton(context),
    );
  }

  Widget getBottomButton(BuildContext context) {
    BorderRadius.circular(50);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              elevation: 10,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(80)))),
          child: const Text('Comprar'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                        create: (_) => UrbanBloc(),
                        child: MultiProvider(
                          providers: [
                            ChangeNotifierProvider(
                              create: (_) => BoletosProvider(),
                              lazy: false,
                            ),
                          ],
                          child: ComprarBoleto(corrida: widget.corrida),
                        ))));
          }),
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
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        maxLines: 5,
      ),
    );
  }

  Widget getHome() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Origen:  ${widget.corrida['municipio_origen']}',
                maxLines: 3,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.orange)),
            const SizedBox(
              height: 5,
            ),
            Text('Destino: ${widget.corrida['municipio_destino']}',
                maxLines: 3,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.orange)),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.black,
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.date_range),
                  Text(
                    'Fecha: ${widget.corrida['fecha']}',
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.timer_outlined),
                  Text(
                    'Hora: ${widget.corrida['hora']}',
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(Icons.person),
                Text(
                  'Asientos Adultos: ${widget.corrida['unidadModel']['asientos_adulto'].toString()}',
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.elderly),
                Text(
                  'Asientos Adultos Mayores: ${widget.corrida['unidadModel']['asientos_adultom'].toString()}',
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.child_care),
                Text(
                  'Asientos Niños: ${widget.corrida['unidadModel']['asientos_niños'].toString()}',
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.airline_seat_recline_normal_rounded),
                Text(
                  'Asientos totales: ${widget.corrida['unidadModel']['asientos_totales'].toString()}',
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              ('Asientos disponibles: '),
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Precio: ${numberFormat.format(widget.corrida['costosModel']['costo'])}',
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
