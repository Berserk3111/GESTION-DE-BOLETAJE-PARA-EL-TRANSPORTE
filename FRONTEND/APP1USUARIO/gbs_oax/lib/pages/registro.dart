// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gbs_oax/pages/components/card_widget.dart';
import 'package:gbs_oax/providers/login_provider.dart';
import 'package:provider/provider.dart';

var nombreController = new TextEditingController();
var apellidopatController = new TextEditingController();
var apellidomatController = new TextEditingController();
var fechanacimientoController = new TextEditingController();
var sexoController = new TextEditingController();
var telefonoController = new TextEditingController();
var emailController = new TextEditingController();
var passwordController = new TextEditingController();
var repeatpassCtrlr = new TextEditingController();
GlobalKey<FormState> keyForm = new GlobalKey();

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: new SingleChildScrollView(
          child: new Container(
        margin: const EdgeInsets.all(25),
        child: Form(),
      )),
    ));
  }

  formItemsDesign(icon, item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(title: item),
    );
  }

  Widget Form() {
    return Center(
        child: Column(children: [_header(context), _bodyform(context)]));
  }

  _header(context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          "Registro",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(0, 0, 0, 1)),
        ),
        const Text(
          "Por favor rellena los campos con tu información",
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  String gender = 'hombre';

  _bodyform(context) {
    return Column(
      children: <Widget>[
        formItemsDesign(
            Icons.person_outline_outlined,
            TextFormField(
              controller: nombreController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                fillColor: Color(0xfff3f4f6),
                filled: true,
                labelText: "Nombre",
              ),
              //validator: validateName,
            )),
        formItemsDesign(
            Icons.abc_outlined,
            TextFormField(
              controller: apellidopatController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                fillColor: Color(0xfff3f4f6),
                filled: true,
                labelText: "Apellido Paterno",
              ),
              //validator: validateName,
            )),
        formItemsDesign(
            Icons.abc_outlined,
            TextFormField(
              controller: apellidomatController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                fillColor: Color(0xfff3f4f6),
                filled: true,
                labelText: "Apellido Materno",
              ),
              //validator: validateName,
            )),
        formItemsDesign(
            Icons.phone,
            TextFormField(
              controller: telefonoController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  fillColor: Color(0xfff3f4f6),
                  filled: true,
                  labelText: "Numero de telefono"),
              keyboardType: TextInputType.phone,
              maxLength: 10,
              //: validateMobile,
            )),
        formItemsDesign(
            Icons.phone,
            TextFormField(
              controller: fechanacimientoController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  fillColor: Color(0xfff3f4f6),
                  filled: true,
                  labelText: "Fecha de nacimiento"),
              //: validateMobile,
            )),
        SizedBox(
          height: 50,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime(1969, 1, 1),
            onDateTimeChanged: (DateTime newDateTime) {
              // Do something
            },
          ),
        ),
        formItemsDesign(
            null,
            Column(children: <Widget>[
              Text("Genero"),
              RadioListTile<String>(
                title: const Text('Hombre'),
                value: 'hombre',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    //gender = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Mujer'),
                value: 'mujer',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    //gender = value;
                  });
                },
              )
            ])),
        formItemsDesign(
            Icons.email,
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              maxLength: 32,
              //validator: validateEmail,
            )),
        formItemsDesign(
            Icons.remove_red_eye,
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
            )),
        formItemsDesign(
            Icons.remove_red_eye,
            TextFormField(
              controller: repeatpassCtrlr,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Repetir la Contraseña',
              ),
              //validator: validatePassword,
            )),
        GestureDetector(
            onTap: () {
              save();
            },
            child: Container(
              margin: EdgeInsets.all(30.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                // ignore: prefer_const_literals_to_create_immutables
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Guardar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ))
      ],
    );
  }

  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El correo es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "Correo invalido";
    } else {
      return null;
    }
  }

  save() {
    if (keyForm.currentState!.validate()) {
      print("Nombre ${nombreController.text}");
      print("Telefono ${telefonoController.text}");
      print("Correo ${emailController.text}");
      keyForm.currentState?.reset();
    }
  }
}
