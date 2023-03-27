// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gbs_oax/providers/registro_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// Variables declaradas para guardar los valores
var nombreController = TextEditingController();
var apellidopatController = TextEditingController();
var apellidomatController = TextEditingController();
var fechanacimientoController = TextEditingController();
var sexoController = TextEditingController();
var telefonoController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var repeatpassCtrlr = TextEditingController();

var fechai = 'Selecciona tu fecha de nacimiento';

GlobalKey<FormState> keyForm = GlobalKey();

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
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.all(25),
        child: form(),
      )),
    ));
  }

  formItemsDesign(icon, item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(title: item),
    );
  }

  Widget form() {
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

  String? gender = 'hombre';

  _bodyform(context) {
    final registroProvider = Provider.of<RegistroProvider>(context);
    return Form(
      key: keyForm,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
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
                  validator: (value) {
                    String pattern = r'(^[a-zA-Z ]*$)';
                    RegExp regExp = new RegExp(pattern);
                    if (value!.isEmpty) {
                      return "El nombre es necesario";
                    } else if (!regExp.hasMatch(value)) {
                      return "El nombre debe de ser a-z y A-Z";
                    }
                    return null;
                  })),
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Debes ingresar los datos requeridos';
                    }
                  })),
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
                validator: (value) {
                  String patttern = r'(^[0-9]*$)';
                  RegExp regExp = new RegExp(patttern);
                  if (value!.isEmpty) {
                    return "El telefono es necesario";
                  } else if (value.length != 10) {
                    return "El numero debe tener 10 digitos";
                  }
                  return null;
                },
              )),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color.fromARGB(255, 255, 254, 250),
            ),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    getDatePickerWidget(context);
                  });
                },
                child: Text(
                  fechai,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
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
                      gender = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Mujer'),
                  value: 'mujer',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                )
              ])),
          formItemsDesign(
              Icons.email,
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  fillColor: Color(0xfff3f4f6),
                  filled: true,
                  labelText: "Email",
                ),
                keyboardType: TextInputType.emailAddress,
                maxLength: 32,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Debes ingresar tu Correo Electronico';
                  } else if (!RegExp(r"^[\w]+@{1}[\w]+\.[a-z]{2,3}$")
                      .hasMatch(value)) {
                    return 'Correo electronico incorrecto';
                  } else {
                    return null;
                  }
                },
              )),
          formItemsDesign(
              Icons.remove_red_eye,
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  fillColor: Color(0xfff3f4f6),
                  filled: true,
                  labelText: "Contraseña",
                ),
              )),
          formItemsDesign(
              Icons.remove_red_eye,
              TextFormField(
                controller: repeatpassCtrlr,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  fillColor: Color(0xfff3f4f6),
                  filled: true,
                  labelText: "Repetir la contraseña",
                ),
                validator: (value) {
                  ("valorrr $value passsword ${passwordController.text}");
                  if (value != passwordController.text) {
                    return "Las contraseñas no coinciden";
                  }
                  return "";
                },
              )),
          ElevatedButton(
              child: Text("asd"),
              onPressed: () {
                FormData formData = FormData.fromMap({
                  'nombre': nombreController.text,
                  'apellido_paterno': apellidopatController.text,
                  'apellido_materno': apellidomatController.text,
                  'telefono': telefonoController.text,
                  'fecha_nacimiento': fechanacimientoController.text,
                  'sexo': gender,
                  'foto_perfil':
                      'https://firebasestorage.googleapis.com/v0/b/wox-cliente.appspot.com/o/fotoPerfil%2FperfilProvisional.jpg?alt=media&token=206a46e9-1a36-4086-a9bb-d6b7f3f398d9%27,%27verificado',
                  'tipoUsuarioModel': 1,
                });
                registroProvider.registro(formData);
              })
          /* GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(30.0),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  // ignore: prefer_const_literals_to_create_immutables
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 222, 118, 14),
                    Color.fromARGB(255, 254, 49, 3),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Text("Guardar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                padding: EdgeInsets.only(top: 16, bottom: 16),
              )) */
        ],
      ),
    );
  }

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
        fechanacimientoController.text = formattedDate2;
      });
    }
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "El correo es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "Correo invalido";
    } else {
      return null;
    }
  }
}
