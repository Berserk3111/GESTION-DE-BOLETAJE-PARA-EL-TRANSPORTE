import 'package:flutter/material.dart';
import 'package:gbs_oax/providers/boletos_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MisBoletos extends StatefulWidget {
  const MisBoletos({super.key});

  @override
  State<MisBoletos> createState() => _MisBoletosState();
}

class _MisBoletosState extends State<MisBoletos> {
  @override
  Widget build(BuildContext context) {
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
                Text(
                  "Mis boletos",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.orange),
                ),
                Text(
                  "Aqui podras consultar tus boletos activos",
                  maxLines: 2,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black),
                ),
              ],
            ),
          )),
      body: getMisBoletos(context),
    );
  }

  Widget getMisBoletos(context) {
    final boletosProvider = Provider.of<BoletosProvider>(context);

    return FutureBuilder(
        future: boletosProvider.getAllBoletosByIdUsuario(1),
        builder: (_, AsyncSnapshot snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return const Center(
              child: Icon(Icons.confirmation_num),
            );
          }
          return Padding(
            padding: EdgeInsets.all(10.0),
            child: SizedBox(
                width: double.maxFinite,
                height: 150,
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          'Activo',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.green),
                        ),
                        Text(
                          'Origen: Oaxaca',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        Text(
                          'Destino: San Juan Yaee',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        Text(
                          'Asiento: 01 Boleto adulto',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Ver codigo QR',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.orange),
                            )),
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}
