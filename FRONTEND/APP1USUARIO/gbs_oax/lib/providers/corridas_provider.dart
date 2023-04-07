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
    //SE TIENE QUE OBTENER EL TOKEN DE AUTORIZACION, SE NECESITA EL SHARED PREFERENCES
    print("getAllCorridas");
    var url = Uri.parse('http://10.0.2.2:8090/corridas');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ6dW5lY2tzQGdtYWlsLmNvbSIsImV4cCI6MTY4MzQ5MTgwOSwibm9tYnJlIjoiSm9zdWUifQ.Wkv5N646wQ7nTzd6lLKQVjT9VX9Wgthpqm-1yHEd8OY'
    });
    var corridas = json.decode(utf8.decode(response.bodyBytes));
    corridasPopulares = corridas;
    print(corridasPopulares);
    notifyListeners();
  }
}
