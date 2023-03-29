// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/Navbar.dart';
import 'package:gbs_oax/pages/registro.dart';
import 'package:gbs_oax/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.all(25),
        child: getBody(),
      )),
    ));
  }

  Widget getBody() {
    var size = MediaQuery.of(context);

    return Center(
        child: Column(
      children: [
        _header(context),
        _inputField(context),
        _forgotPassword(context),
        _signup(context),
      ],
    ));
  }

  _header(context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          "GBS",
          style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(250, 74, 12, 1)),
        ),
        SizedBox(
          height: 70,
        ),
        const Text(
          "Iniciar Sesión",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  _inputField(context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: emailController,
          decoration: InputDecoration(
              hintText: "ejemplo@gmail.com",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColorDark.withOpacity(0.1),
              filled: true,
              labelText: "Email",
              prefixIcon: const Icon(Icons.person_2_outlined)),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "introduce tu contraseña",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColorDark.withOpacity(0.1),
            filled: true,
            labelText: "Contraseña",
            prefixIcon: const Icon(Icons.password_outlined),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 15),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(250, 74, 12, 1),
                shadowColor: Color.fromARGB(255, 0, 0, 0)),
            child: Text("Iniciar Sesión"),
            onPressed: () {
              loginProvider
                  .login(emailController.text, passwordController.text)
                  .then((values) {
                if (values.length > 0) {
                  //Aqui redireccionas al Navbar
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return Navbar();
                  }), (Route<dynamic> route) => false);
                } else {
                  setState(() {});
                  final snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Lo siento!',
                      message:
                          'Email no registrado, por favor registrate para iniciar sesion!',

                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.failure,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);

                  const SizedBox(height: 15);
                }
              });
            })
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
        onPressed: () {}, child: const Text("Recuperar contraseña"));
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("No tienes una cuenta? "),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Registro()),
              );
            },
            child: const Text("Registrarse"))
      ],
    );
  }
}
