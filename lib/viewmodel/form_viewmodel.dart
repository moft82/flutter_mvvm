import 'package:flutter/material.dart';

class FormViewModel extends ChangeNotifier {
  bool _chekced = false;

  bool get checked => _chekced;

  set setChecked(bool checked){
    _chekced = checked;
    notifyListeners();
  }


  bool _switchChecked = false;
  bool get switchChecked => _switchChecked;
  set setSwitchChecked(bool checked){
    _switchChecked = checked;
    notifyListeners();
  }

  String _dropdownVal = "Option 1";
  String get dropdownVal => _dropdownVal;
  set setDropdownVal(String val){
    _dropdownVal = val;
    notifyListeners();
  }

  double _sliderVal = 50;
  double get sliderVal => _sliderVal;
  set setSliderVal(double val){
    _sliderVal = val;
    notifyListeners();
  }
}
