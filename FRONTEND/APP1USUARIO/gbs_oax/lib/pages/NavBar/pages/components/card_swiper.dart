import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/components/card_widget.dart';

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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Mas Buscados",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, int index) {
                return card_vertical();
              }),
        )
      ]),
    );
  }
}
