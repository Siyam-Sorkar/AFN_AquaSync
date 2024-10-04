import 'package:flutter/material.dart';

class DataModel extends ChangeNotifier{
  bool _irrigationStatus  = false;
  int _moistureLevel      = 0;
  double _temperature     = 0;
  double _humidity        = 0;

  int get moistureLevel      => _moistureLevel;
  bool get irrigatioinStatus => _irrigationStatus;
  double get temperature     => _temperature;
  double get humidity        => _humidity;


  void updateGroundData({
    required int moisture,
    required double temp,
    required double humid})
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