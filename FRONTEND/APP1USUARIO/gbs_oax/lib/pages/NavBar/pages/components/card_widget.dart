import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/detalleCorrida/detalleCorrida.dart';

class card_vertical extends StatefulWidget {
  final corrida;
  const card_vertical({Key? key, required this.corrida}) : super(key: key);

  @override
  State<card_vertical> createState() => _card_verticalState();
}

class _card_verticalState extends State<card_vertical> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      child: Card(
          clipBehavior: Clip.hardEdge,
          elevation: 8,
          color: Colors.grey.shade900,
          margin: EdgeInsets.symmetric(horizontal: 30),
          shadowColor: Colors.grey,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
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
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.grey.shade900,
                    backgroundImage: NetworkImage(
                        "https://cdn.forbes.com.mx/2020/02/Huatulco-Sectur-Oaxaca-1.jpg"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          widget.corrida['ciudad_destino'],
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                        Center(
                            child: Text(
                          widget.corrida['municipio_destino'],
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Center(
                              child: Text(
                            'Mas info',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 94, 0, 1),
                                fontSize: 15),
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}
