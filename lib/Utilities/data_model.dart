import 'package:flutter/material.dart';

class DataModel extends ChangeNotifier{
  bool _irrigationStatus   = false;
  int _moistureLevel      = 0;
  int _temperature        = 0;
  int _humidity           = 0;

  int get moistureLevel      => _moistureLevel;
  bool get irrigatioinStatus => _irrigationStatus;
  int get temperature     => _temperature;
  int get humidity        => _humidity;


  void updateGroundData({
    required int moisture,
    required int temp,
    required int humid})
  {
    _moistureLevel = moisture;
    _temperature   = temp;
    _humidity      = humid;
    // print('$_moistureLevel, $_temperature, $_humidity');
    notifyListeners();
  }

  void irrigationToggler(bool status){
    _irrigationStatus = status;
    notifyListeners();
  }
}