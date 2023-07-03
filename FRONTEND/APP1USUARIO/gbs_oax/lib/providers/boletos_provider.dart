import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/registro.dart';
import 'package:http/http.dart' as http;

class BoletosProvider extends ChangeNotifier {
  List<dynamic> boletos = [];

  Dio dio = Dio();

  BoletosProvider() {
    print("BOLETOS PROVIDER!!!");
  }

  getAllBoletos() async {
    print("getBoletos");
    var url = Uri.parse('http://10.0.2.2:8090/corridas');
    final response = await http.get(url);
    var corridas = json.decode(utf8.decode(response.bodyBytes));
    boletos = corridas;

    return boletos;
  }

  getAllBoletosByIdUsuario(id) async {
    print("getBoletos");
    var url = Uri.parse('http://10.0.2.2:8090/boleto');
    final response = await http.get(url);
    var corridas = json.decode(utf8.decode(response.bodyBytes));
    boletos = corridas;

    return boletos;
  }

  Registro(formData, nombre, apellidos) async {
    try {
      await dio
          .post('http://10.0.2.2:8090/boletos', data: formData)
          .then((value) async {
        FormData formDataLogin = FormData.fromMap({
          'nombre': nombre,
          'apellidos': apellidos,
        });
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
