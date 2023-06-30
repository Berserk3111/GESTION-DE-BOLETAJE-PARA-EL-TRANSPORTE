import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BoletosProvider extends ChangeNotifier {
  List<dynamic> boletos = [];

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
}
