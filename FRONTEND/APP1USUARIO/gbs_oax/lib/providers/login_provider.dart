import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/login.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {

  Dio dio = Dio();

  login(email, password) async {
    var url = Uri.parse('http://10.0.2.2:8090/login/iniciarSesion/');
    try {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        var response = await http
            .post(url, headers: {'email': email, 'password': password});
        var datos = json.decode(utf8.decode(response.bodyBytes));
        return (datos);
      }
    } catch (e) {
      return (e);
    }
  }
}
