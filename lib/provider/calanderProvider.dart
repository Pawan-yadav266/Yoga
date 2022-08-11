import 'package:flutter/material.dart';
import 'package:yoga_new/services/newDb.dart';

class CalanderProvider with ChangeNotifier{

  List<DateTime> list = [];
  bool isCalander = false;

  CalanderList()async{
    List<DateTime> n = await DatabaseService.databaseService.queryAll();
    list = n;
    notifyListeners();
    isCalander=true;
    notifyListeners();
  }

  CalanderProvider(){CalanderList();}


}