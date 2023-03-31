import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CorridasProvider extends ChangeNotifier {
  CorridasProvider() {
    print("CORRIDAS PROVIDER!!!");
    //getAllCorridas();
  }

  getAllCorridas() async {
    print("getAllCorridas");
    var url = Uri.parse('http://10.0.2.2:8090/corridas/');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var corridas = json.decode(utf8.decode(response.bodyBytes));
      print(corridas);
    }
  }
}
