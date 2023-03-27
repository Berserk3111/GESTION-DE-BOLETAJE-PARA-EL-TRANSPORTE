import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/login.dart';
import 'package:http/http.dart' as http;

class RegistroProvider extends ChangeNotifier {
  RegistroProvider() {}

  Dio dio = new Dio();

  registro(formData, email, password) async {
    try {
      FormData formDatalogin = FormData.fromMap({});
      await dio
          .post('http://10.0.2.2:8090/usuario', data: formData)
          .then((value) async {
        FormData formDataLogin = FormData.fromMap({
          'email': email,
          'password': password,
          'usuarioModel': value.data["id"]
        });
        await dio.post('http://10.0.2.2:8090/login', data: formDatalogin);
      });
    } catch (e) {
      print(e);
    }
  }
}
