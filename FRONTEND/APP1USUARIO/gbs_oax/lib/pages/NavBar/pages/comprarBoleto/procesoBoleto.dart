import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
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

  Icon seat = const Icon(
    Icons.event_seat,
    size: 100,
  );

  int? tipoPasaje;

  void selectSeat(index) {
    setState(() {
      if (selectedSeats.contains(index)) {
        this.seat = const Icon(Icons.airline_seat_legroom_normal);
        selectedSeats.remove(index);
      } else {
        this.seat = const Icon(Icons.event_seat);
        selectedSeats.add(index);
      }
    });
  }

  Icon getIcon(index) {
    if (selectedSeats.contains(index)) {
      return (const Icon(Icons.event_seat_rounded));
    } else {
      return (const Icon(Icons.event_seat));
    }
  }

  Color getColor(index) {
    if (selectedSeats.contains(index) && tipoPasaje == 1) {
      return Colors.yellow;
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Seleccione el Tipo de Asiento",
                style: GoogleFonts.montserrat(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.child_care),
                    onPressed: () {
                      setState(() {
                        tipoPasaje = 1;
                      });
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        tipoPasaje = 2;
                      });
                    },
                    icon: const Icon(Icons.person),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        tipoPasaje = 3;
                      });
                    },
                    icon: const Icon(Icons.elderly),
                  )
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Niño"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Adulto"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Tercera Edad"),
                  )
                ],
              ),
            ],
          ),
          Text("Asientos Totales: ${selectedSeats.length}",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.orange)),
          Expanded(child: getHome()),
          const SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedSeats.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PassengerDetailsPage(selectedSeats: selectedSeats,
                    corrida: widget.corrida),
              ),
            );
          } else {
            setState(() {});
            final snackBar = SnackBar(
              /// need to set following properties for best effect of awesome_snackbar_content
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Lo siento!',
                message: 'Parece que no has seleccionado un boleto',

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType: ContentType.failure,
              ),
            );
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);

            const SizedBox(height: 10);
          }
        },
        child: const Icon(Icons.arrow_forward),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        color: Colors.transparent,
        child: GridView.count(
          mainAxisSpacing: BorderSide.strokeAlignCenter,
          crossAxisSpacing: 2.5,
          crossAxisCount: 4,
          children: List.generate(
              widget.corrida['unidadModel']['asientos_totales'], (index) {
            String seatNumber = 'Asiento ${index + 1}';
            if (widget.corrida['unidadModel']['asientos_totales'] == 16) {
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
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: getColor(index),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: getIcon(index),
                    ));
              } else {
                return (const Icon(Icons.block_outlined));
              }
            } else if (widget.corrida['unidadModel']['asientos_totales'] ==
                20) {
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
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: getColor(index),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: getIcon(index),
                    ));
              } else {
                return (const Icon(Icons.block_outlined));
              }
            } else if (widget.corrida['unidadModel']['asientos_totales'] ==
                24) {
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
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: getColor(index),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: getIcon(index),
                    ));
              } else {
                return (const Icon(Icons.block_outlined));
              }
            }
            {
              return CircularProgressIndicator(
                color: Colors.amber,
              );
            }
          }),
        ),
      ),
    );
  }
}
