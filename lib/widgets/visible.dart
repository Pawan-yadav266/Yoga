import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_new/provider/zeroToTHirty.dart';

class Visible extends StatelessWidget {
  Visible({Key? key, required this.isVisible, required this.value})
      : super(key: key);

  bool isVisible;
  dynamic value;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) { return ZeroToThirty(); },
      child: Scaffold(
        body: Visibility(
            visible: isVisible,
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: Colors.blueAccent.withOpacity(0.9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pause',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('Yoga for better life',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.normal)),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                          border: Border.all(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Colors.black)),
                      child: Center(
                          child: Text('Restart',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                          border: Border.all(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Colors.black)),
                      child: Center(
                          child: Text('Quit',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      ZeroToThirty().isvisible =false;
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Colors.black),
                          color: Colors.white),
                      child: const Center(
                          child: Text('RESUME',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold))),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
