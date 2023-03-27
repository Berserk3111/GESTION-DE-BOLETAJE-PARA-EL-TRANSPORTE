// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/registro.dart';
import 'package:gbs_oax/providers/login_provider.dart';
import 'package:provider/provider.dart';

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
          body: Container(
            margin: const EdgeInsets.all(25),
            child: getBody(),
          )),
    );
  }

  Widget getBody() {
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
      const Text(
        "Login",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Text(
        "Por favor rellena los campos con tu información",
        textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
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
      const SizedBox(height: 5),
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
      const SizedBox(height: 5),
      ElevatedButton(
        child: Text("asd"),
        onPressed: () =>
            loginProvider.login(emailController.text, passwordController.text),
      )
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
