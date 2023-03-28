import 'package:flutter/material.dart';

class CorridasProvider extends ChangeNotifier{
  CorridasProvider() {
    getAllCorridas();
  }

  getAllCorridas() async {
    print('getAllCorridas');
  }
}
