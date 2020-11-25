import 'package:flutter/material.dart';

class Provider extends ChangeNotifier{

  delete(){

    notifyListeners();
  }

}