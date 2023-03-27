import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CorridasProvider extends ChangeNotifier{
  CorridasProvider() {
    print('CorridasProvider inicializado');

    this.getOnDisplayCorridas();
  }

  getOnDisplayCorridas() async {
    print('getOnDisplayCorridas');
  }
}
