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
  List<String> selectedSeats = [];

  void selectSeat(String seat) {
    setState(() {
      if (selectedSeats.contains(seat)) {
        selectedSeats.remove(seat);
      } else {
        selectedSeats.add(seat);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getHome(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PassengerDetailsPage(selectedSeats),
            ),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  AppBar getAppBar() {
    BorderRadius.circular(80);
    return AppBar(
      toolbarHeight: 100,
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
    return SizedBox(
      width: 250,
      child: GridView.count(
        mainAxisSpacing: BorderSide.strokeAlignCenter,
        crossAxisCount: 3,
        children: List.generate(15, (index) {
          String seatNumber = 'Asiento ${index + 1}';
          return GestureDetector(
            onTap: () {
              selectSeat(seatNumber);
            },
            child: Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selectedSeats.contains(seatNumber)
                    ? Colors.green
                    : Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  seatNumber,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
