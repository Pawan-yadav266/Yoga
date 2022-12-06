import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yoga_new/screen/WorkOUtDet.dart';

class ZeroToFive with ChangeNotifier {


  bool isvisible = false;
  int fivecount=5;
  fiveCount(BuildContext context) async{
    Timer.periodic(Duration(seconds: 1), (timer) {
      fivecount-=1;
      notifyListeners();
      if(fivecount==0)
        {
          timer.cancel();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>WorkOutDet()));
        }

    });
  }

  visibletrue()
  {
    isvisible=true;
    notifyListeners();
  }

  visiblefalse()
  {
    isvisible = false;
    notifyListeners();
  }


  ZeroToFive.fiveCount(BuildContext context){
    fiveCount(context);
  }

}
