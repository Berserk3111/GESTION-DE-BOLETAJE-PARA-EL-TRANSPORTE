import 'package:flutter/material.dart';

class card_vertical extends StatefulWidget {
  const card_vertical({data});

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
                debugPrint('card pulsada');
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.grey.shade900,
                    backgroundImage: NetworkImage("https://cdn.forbes.com.mx/2020/02/Huatulco-Sectur-Oaxaca-1.jpg"),
                  ),
                  const SizedBox(
                    width: 300,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          Center(
                              child: Text(
                            'Oaxaca',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                          Center(
                              child: Text(
                            'Huatulco',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Center(
                                child: Text(
                              'Mas info',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 94, 0, 1),
                                  fontSize: 20),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
