import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_new/screen/Finish.dart';

import 'NewExersise.dart';
import 'newexercise1.dart';

class BreakTime1 extends StatelessWidget {
  const BreakTime1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Breaktimer>(
      create: (BuildContext context) {
        return Breaktimer.fiveCount(context);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1600881333189-0b1493acbd73?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d29ya291dCUyMGJyZWFrfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('BREAK TIME',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Consumer<Breaktimer>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Text('${value.fivecount.toString()}s',
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.white));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        height: 50,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: InkWell(
                              onTap: ()=>{Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NewExercise()))},
                              child: Text(
                                'SKIP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                            ))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Text('PREVIOUS',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))),
                        InkWell(
                            onTap: () {},
                            child: Text('NEXT',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 3,
                    color: Colors.black,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text(
                          'Next: DAND BETHAK',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class Breaktimer with ChangeNotifier {
  int fivecount = 10;
  fiveCount(BuildContext context) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      fivecount -= 1;
      notifyListeners();
      if (fivecount == 0) {
        timer.cancel();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>WorkOutDet1()));
      }
    });
  }


  Breaktimer.fiveCount(BuildContext context) {
    fiveCount(context);
  }
}
