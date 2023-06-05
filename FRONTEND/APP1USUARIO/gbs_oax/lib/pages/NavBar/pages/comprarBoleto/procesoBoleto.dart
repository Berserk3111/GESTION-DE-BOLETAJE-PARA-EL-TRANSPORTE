import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/comprarBoleto/detallesPasajero.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class SeatSelectionPage extends StatefulWidget {
  final corrida;
  const SeatSelectionPage({Key? key, required this.corrida}) : super(key: key);

  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  List<int> selectedSeats = [];

  Icon seat = Icon(
    Icons.event_seat,
    size: 100,
  );

  int? tipoPasaje;

  void selectSeat(index) {
    setState(() {
      if (selectedSeats.contains(index)) {
        this.seat = Icon(Icons.airline_seat_legroom_normal);
        selectedSeats.remove(index);
      } else {
        this.seat = Icon(Icons.event_seat);
        selectedSeats.add(index);
      }
    });
  }

  Icon getIcon(index) {
    if (selectedSeats.contains(index)) {
      return (Icon(Icons.event_seat_rounded));
    } else {
      return (Icon(Icons.event_seat));
    }
  }

  Color getColor(index) {
    if (selectedSeats.contains(index) && tipoPasaje == 1) {
      return Colors.green;
    }
    if (selectedSeats.contains(index) && tipoPasaje == 2) {
      return Colors.blue;
    }
    if (selectedSeats.contains(index) && tipoPasaje == 3) {
      return Colors.amber;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: getHome()),
          Text("Seleccione el Tipo de Asiento",
              style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.child_care),
                      color: Colors.green,
                      onPressed: () {
                        setState(() {
                          print("niño");
                          tipoPasaje = 1;
                        });
                      },
                    ),
                    Text("Niño",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.person),
                      color: Colors.blue,
                      onPressed: () {
                        setState(() {
                          print("adulto");
                          tipoPasaje = 2;
                        });
                      },
                    ),
                    Text("Adulto",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.elderly),
                      color: Colors.amber,
                      onPressed: () {
                        setState(() {
                          print("tercera edad");
                          tipoPasaje = 3;
                        });
                      },
                    ),
                    Text("Tercera Edad",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black))
                  ],
                ),
                Text("Asientos Totales: ${selectedSeats.length}",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.orange))
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedSeats.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PassengerDetailsPage(selectedSeats),
              ),
            );
          } else {
            print('Selecciona algo');
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  AppBar getAppBar() {
    BorderRadius.circular(80);
    return AppBar(
      toolbarHeight: 70,
      elevation: 5,
      iconTheme: const IconThemeData(color: Colors.black, size: 30, weight: 10),
      backgroundColor: Colors.white,
      title: Text(
        'Seleccion de asientos',
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      ),
    );
  }

  Widget getHome() {
    return Container(
      width: 250,
      color: Colors.grey.shade700,
      child: GridView.count(
        mainAxisSpacing: BorderSide.strokeAlignCenter,
        crossAxisSpacing: 2.5,
        crossAxisCount: 4,
        children: List.generate(20, (index) {
          String seatNumber = 'Asiento ${index + 1}';
          if (index != 0 &&
              index != 1 &&
              index != 7 &&
              index != 6 &&
              index != 10 &&
              index != 14) {
            return GestureDetector(
                onTap: () {
                  if (tipoPasaje == null) {
                    print("selecciona tipo pasaje");
                  } else {
                    selectSeat(index);
                  }
                },
                child: Container(
                  width: 250,
                  height: 100,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: selectedSeats.contains(index)
                        ? Colors.green
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: getIcon(index)),
                ));
          } else {
            return (Icon(Icons.block_outlined));
          }
        }),
      ),
    );
  }
}
