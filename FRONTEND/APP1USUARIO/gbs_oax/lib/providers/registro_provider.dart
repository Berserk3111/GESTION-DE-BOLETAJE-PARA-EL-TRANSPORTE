import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegistroProvider extends ChangeNotifier {
  
  Dio dio = Dio();

  registro(formData, email, password) async {
    try {
      await dio
          .post('http://10.0.2.2:8090/usuario', data: formData)
          .then((value) async {
        FormData formDataLogin = FormData.fromMap({
          'email': email,
          'password': password,
          'usuarioModel': value.data["id"]
        });
        await dio.post('http://10.0.2.2:8090/login', data: formDataLogin);
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
