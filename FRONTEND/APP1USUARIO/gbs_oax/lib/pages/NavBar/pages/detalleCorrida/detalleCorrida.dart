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
      appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "Detalles del Viaje",
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
              ],
            ),
          )),
      body: getHome(),
    );
  }

  Widget getHome() {
    return Container(
        child: Card(
      elevation: 5,
      margin: EdgeInsets.all(15),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FadeInImage.assetNetwork(
                placeholder: '../assets/load.gif',
                image:
                    "https://cdn.forbes.com.mx/2020/02/Huatulco-Sectur-Oaxaca-1.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: Column(
              children: [
                Center(
                    child: Text(
                  widget.corrida['municipio_origen'],
                  style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
                Center(
                    child: Text(
                  widget.corrida['municipio_destino'],
                  style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
                Center(
                    child: Text(
                  ('Asientos totales: ') +
                      widget.corrida['unidadModel']['asientos_totales']
                          .toString(),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                )),
                Center(
                    child: Text(
                  ('Precio: ') +
                      numberFormat
                          .format(widget.corrida['costosModel']['costo']),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: ElevatedButton(
                    child: Text('Comprar'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ComprarBoleto(corrida: widget.corrida)));
                    }
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
