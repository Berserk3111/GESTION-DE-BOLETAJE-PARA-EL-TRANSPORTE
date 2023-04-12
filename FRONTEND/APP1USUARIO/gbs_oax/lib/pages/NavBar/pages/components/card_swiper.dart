import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/components/card_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class CardSwiper extends StatefulWidget {
  final List<dynamic> corridas;

  const CardSwiper({Key? key, required this.corridas}) : super(key: key);

  @override
  State<CardSwiper> createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (widget.corridas.isEmpty) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.black,
          ),
        ),
      );
    }

    return Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Mas Buscados",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.orange),
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.corridas.length, //aui debe cambiarse
                itemBuilder: (_, int index) {
                  return card_vertical(corrida: widget.corridas[index]);
                }),
          )
        ]));
  }
}
