import 'package:flutter/material.dart';

class ContainerModel with ChangeNotifier {
  double _width = 100;
  double _height = 100;
  double _borderRadius = 0;

  double get width => _width;
  double get height => _height;
  double get borderRadius => _borderRadius;

  void setWidth(double value) {
    _width = value;
    notifyListeners();
  }

  void setHeight(double value) {
    _height = value;
    notifyListeners();
  }

  void setBorderRadius(double value) {
    _borderRadius = value;
    notifyListeners();
  }
}
