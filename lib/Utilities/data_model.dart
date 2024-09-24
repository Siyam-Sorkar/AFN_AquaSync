import 'package:flutter/material.dart';

class DataModel extends ChangeNotifier{
  int _moistureLevel = 75;

  int get moistureLevel => _moistureLevel;

  void increment(){
    _moistureLevel += 10;
    notifyListeners();
  }
}