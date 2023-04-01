import 'package:flutter/material.dart';

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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "Detalles del Viaje",
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
              ],
            ),
          )),
      body: getHome(),
    );
  }

  Widget getHome() {
    return Card(
      child: Text(
        widget.corrida['municipio_destino'],
      ),
    );
  }
}
