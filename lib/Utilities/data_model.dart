import 'package:flutter/material.dart';

class DataModel extends ChangeNotifier{
  int _moistureLevel = 0;
  bool _rrigationStatus = false;

  int get moistureLevel => _moistureLevel;
  bool get irrigatioinStatus => _rrigationStatus;

  void increment(){
    _moistureLevel >= 100? _moistureLevel = 0 :
    _moistureLevel += 10;
    notifyListeners();
  }

  void irrigationToggler(bool status){
    _rrigationStatus = status;
    notifyListeners();
  }
}