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
        //contruir componente
        );
  }
}
