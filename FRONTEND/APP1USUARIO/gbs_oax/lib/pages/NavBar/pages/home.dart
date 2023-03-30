import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/components/card_widget.dart';
import 'package:gbs_oax/pages/registro.dart';
import 'package:gbs_oax/providers/corridas_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

GlobalKey<FormState> keyForm = GlobalKey();

TextEditingController dateInput = TextEditingController();
TimeOfDay selectedTime = TimeOfDay.now();
TimeOfDay? picked;

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                "Bienvenido",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              ),
              const Text(
                "Rellena los campos para encontrar su mejor opcion de viaje",
                maxLines: 2,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              ),
            ],
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
    const double size02 = 25.0;
    var size = MediaQuery.of(context);
    padding:
    new EdgeInsets.all(10.0);
    return (Column(children: [
      Form(
          key: keyForm,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              formItemsDesign(TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  fillColor: Colors.grey.shade600,
                  filled: true,
                  labelText: "Origen",
                ),
              )),
              formItemsDesign(TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  fillColor: Colors.grey.shade600,
                  filled: true,
                  labelText: "Destino",
                ),
              )),
              formItemsDesign(TextFormField(
                  controller: dateInput,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.shade600,
                    filled: true,
                    labelText: "Fecha",
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateInput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  })),
              Row(
                children: <Widget>[
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50),
                      backgroundColor: Colors.grey.shade600,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      elevation: 5,
                    ),
                    child: const Text("Hora"),
                    onPressed: () => _selectTime(context),
                  )),
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50),
                      backgroundColor: Colors.grey.shade600,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      elevation: 5,
                    ),
                    child: const Text("Hora"),
                    onPressed: () => _selectTime(context),
                  ))
                ],
              ),
            ],
          )),
    ]));
  }
}
