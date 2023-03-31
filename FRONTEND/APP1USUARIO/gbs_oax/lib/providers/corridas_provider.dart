import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CorridasProvider extends ChangeNotifier {
  List<dynamic> corridasPopulares = [];

  CorridasProvider() {
    print("CORRIDAS PROVIDER!!!");
    getAllCorridas();
  }

  getAllCorridas() async {
    print("getAllCorridas");
    var url = Uri.parse('http://10.0.2.2:8090/corridas');
    final response = await http.get(url);
    var corridas = json.decode(utf8.decode(response.bodyBytes));
    corridasPopulares = corridas;
    notifyListeners();
  }
}
