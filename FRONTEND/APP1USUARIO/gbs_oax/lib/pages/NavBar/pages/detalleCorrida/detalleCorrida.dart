import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/comprarBoleto/comprarBoleto.dart';
import 'package:intl/intl.dart';

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
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 10,
              ),
              child: Text('Comprar'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ComprarBoleto(corrida: widget.corrida)));
              }),
        ),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      toolbarHeight: 150,
      elevation: 10,
      iconTheme: IconThemeData(color: Colors.white, size: 30, weight: 10),
      flexibleSpace: Image.network(
          "https://cdn.forbes.com.mx/2020/02/Huatulco-Sectur-Oaxaca-1.jpg",
          fit: BoxFit.cover),
      backgroundColor: Colors.white,
      title: Text(
        widget.corrida["ciudad_destino"] +
            ", " +
            widget.corrida["municipio_destino"],
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        maxLines: 5,
      ),
    );
  }

  Widget getHome() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.corrida['municipio_origen'],
              style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.corrida['municipio_destino'],
              style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              ('Asientos totales: ') +
                  widget.corrida['unidadModel']['asientos_totales'].toString(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              ('Precio: ') +
                  numberFormat.format(widget.corrida['costosModel']['costo']),
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
