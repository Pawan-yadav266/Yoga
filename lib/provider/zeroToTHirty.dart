import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yoga_new/services/newDb.dart';

import '../screen/Break.dart';
import '../screen/Finish.dart';

class ZeroToThirty with ChangeNotifier
{
  bool isvisible = false;
  int fivecount=5;
  fiveCount(BuildContext context) async{
    Timer.periodic(Duration(seconds: 1), (timer) {
      isvisible?fivecount+0:fivecount-=1;
      notifyListeners();

      if(fivecount==0)
      {
        timer.cancel();
        Future.delayed(Duration(seconds: 1));
        Navigator.push(context, MaterialPageRoute(builder: (_)=>BreakTime()));
      }

    });
  }


  gvisible(){

  }


  visibletrue()
  {
    isvisible=true;
    notifyListeners();
  }
  visiblefalse()
  {
    isvisible=false;
    notifyListeners();
  }

  ZeroToThirty();

  ZeroToThirty.name(BuildContext context){fiveCount(context);}

}