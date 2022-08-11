import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_new/provider/zeroToFiveCount.dart';
import 'package:yoga_new/provider/zeroToTHirty.dart';
import 'package:yoga_new/screen/WorkOUtDet.dart';

class AreYouReady extends StatefulWidget {
  const AreYouReady({Key? key}) : super(key: key);

  @override
  State<AreYouReady> createState() => _AreYouReadyState();
}

class _AreYouReadyState extends State<AreYouReady> {

  int c=0;
  @override
  void initState() {
    // TODO: implement initState
    c=1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<ZeroToFive>(
      create: (BuildContext context) { return ZeroToFive.fiveCount(context); },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/2-50),
                  Text(
                    'ARE YOU READY?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(height: 30,),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Color.lerp(Colors.blue,Colors.white,.7),
                    child: Consumer<ZeroToFive>(
                        builder: (BuildContext context, value, Widget? child) {
                          return Text(
                            value.fivecount.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.black),
                          );
                        }
                    ),
                  )

                ],
              ),
            ),
            Spacer(),
            Divider(thickness: 2,),
            Align(alignment:Alignment.bottomLeft,child:Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            child: Text('Next: Anulom Vilom',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),),

          ],
        ),
      ),
    );
  }
}
