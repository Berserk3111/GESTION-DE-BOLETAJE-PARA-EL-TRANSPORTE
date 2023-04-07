import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/login.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  Dio dio = Dio();

  login(email, password) async {
    var url = Uri.parse('http://10.0.2.2:8090/login/iniciarSesion/');

    //URL PARA OBTENER TOKEN
    var urlToken = Uri.parse('http://10.0.2.2:8090/pruebas');

    var usuario;
    //SE OBTIENE TOKEN SOLO SI ES UN USUARIO REGISTRADO
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var bodyLogin = jsonEncode({
        'id_login': 1,
        'email': emailController.text,
        'password': passwordController.text
      });

      await http.post(url, body: bodyLogin, headers: {
        'Content-Type': 'application/json; charset=UTF-8'
      }).then((response) async {
        usuario = json.decode(utf8.decode(response.bodyBytes));
        if (usuario.length > 0) {
          var body = jsonEncode({
            'email': emailController.text,
            'password': passwordController.text
          });

          await http.post(urlToken, body: body).then((response) async {
            var token = response.headers["authorization"];
            print(token);
          });
        }
      });

      return (usuario);
    }
  }
}
