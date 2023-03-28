// ignore_for_file: sort_child_properties_last, prefer_const_constructors
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dio/dio.dart';
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
                    RegExp regExp = RegExp(pattern);
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
                    } else {
                      return null;
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
                  return null;
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
                registroProvider
                    .registro(
                        formData, emailController.text, passwordController.text)
                    .then((values) => {
                          if (values == true)
                            {
                              Navigator.popAndPushNamed(context, 'login'),
                              keyForm.currentState?.reset()
                            }
                          else
                            {
                              setState(() {
                                final snackBar = SnackBar(
                                  /// need to set following properties for best effect of awesome_snackbar_content
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'Lo siento!',
                                    message:
                                        'Parece que no has completado todos los campos!',

                                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                    contentType: ContentType.failure,
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);

                                const SizedBox(height: 10);
                              })
                            }
                        });
              })
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

  alert(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Alerta',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(248, 212, 90, 1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Aceptar',
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                ),
              )
            ],
            content:
                Text('Comprueba que ingresaste todos los datos correctamente'),
          );
        });
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
