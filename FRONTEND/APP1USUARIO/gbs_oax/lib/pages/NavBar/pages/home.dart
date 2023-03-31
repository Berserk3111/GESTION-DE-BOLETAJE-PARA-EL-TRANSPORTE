import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/components/card_swiper.dart';
import 'package:gbs_oax/pages/NavBar/pages/components/card_widget.dart';
import 'package:gbs_oax/providers/corridas_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

GlobalKey<FormState> keyForm = GlobalKey();

TextEditingController dateInput = TextEditingController();
TimeOfDay? time = TimeOfDay.now();
TimeOfDay? picked;

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  "Bienvenido",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
                Text(
                  "Rellena los campos para encontrar su mejor opcion de viaje",
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

  formItemsDesign(item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(title: item),
    );
  }

  Widget getHome() {
    final corridasProvider = Provider.of<CorridasProvider>(context);

    const double size02 = 25.0;

    var size = MediaQuery.of(context);

    return (Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: listaDesplegable(1),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: listaDesplegable(2),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: getFecha(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: getHora(),
                )
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 50),
                minimumSize: const Size(50, 50),
                backgroundColor: Colors.grey.shade900,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                elevation: 2,
              ),
              child: const Text("Buscar Viaje"),
              onPressed: () => {print("buscar")},
            ),
            const SizedBox(height: 30),
            Expanded(
                child:
                    CardSwiper(corridas: corridasProvider.corridasPopulares)),
            const SizedBox(
              height: 10,
            )
          ],
        )));
  }

  var hora = "Hora";

  Widget getHora() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(150, 50),
        minimumSize: const Size(50, 50),
        backgroundColor: Colors.grey.shade900,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        elevation: 2,
      ),
      child: Text(hora),
      onPressed: () => selectTime(context),
    );
  }

  Widget getFecha() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(150, 50),
          minimumSize: const Size(50, 50),
          backgroundColor: Colors.grey.shade900,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          elevation: 2,
        ),
        onPressed: () {
          setState(() {
            getDatePickerWidget(context);
          });
        },
        child: Text(
          fechai,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ));
  }

  Widget listaDesplegable(tipo) {
    var oficios2 = ["asd", "fgh"];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        items: oficios2
            .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(
                  //value: value["nombre"].toString(),
                  //child: Text(value["nombre"]),
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ))
            .toList(),
        hint: Text(tipo == 1 ? "Origen" : "Destino",
            style: TextStyle(color: Colors.white)),
        icon: tipo == 1
            ? const Icon(
                Icons.home_outlined,
                color: Colors.white,
              )
            : const Icon(Icons.location_on, color: Colors.white),
        iconSize: 20,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade900,
            labelText: null,
            labelStyle: const TextStyle(color: Colors.black),
            contentPadding: const EdgeInsets.all(8.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
        elevation: 8,
        onChanged: (value) {
          if (tipo == 1) {
            print("origen");
          }
          if (tipo == 2) {
            print("destino");
          }
        },
        validator: (value) {
          if (tipo == 1) {
            if (value == null) {
              return 'Selecciona un Origen';
            } else {
              return null;
            }
          }
          if (tipo == 2) {
            if (value == null) {
              return 'Selecciona un Destino';
            } else {
              return null;
            }
          }
        },
      ),
    );
  }

  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: time!,
    );

    if (picked != null) {
      setState(() {
        time = picked;
        hora = '${time!.hour}: ${time!.minute}';
      });
    }
  }

  var fechai = 'Fecha';

  getDatePickerWidget(BuildContext context) async {
    int anio = DateTime.now().year - 18;
    int mes = DateTime.now().month;
    int dia = DateTime.now().day;
    DateTime mayor = DateTime(anio, mes, dia);
    DateTime? seleccion = await showDatePicker(
      context: context,
      initialDate: mayor,
      firstDate: DateTime(1900),
      lastDate: mayor,
    );
    if (seleccion != null) {
      setState(() {
        String formattedDate2 = DateFormat('yyyy-MM-dd').format(seleccion);
        fechai = formattedDate2;
        //fechaController.text = formattedDate2;
        //print(fechaController.text);
      });
    }
  }
}
