import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_new/provider/zeroToTHirty.dart';
import 'package:yoga_new/widgets/visible.dart';

import '../provider/newExerciseProvider.dart';
import '../provider/zeroToFiveCount.dart';

class NewExercise extends StatelessWidget {
  const NewExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewZeroToThirty>(
      create: (BuildContext context) { return NewZeroToThirty.name(context); },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 320,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://s3.amazonaws.com/prod.skimble/assets/1632578/image_iphone.jpg')

                      )
                  ),
                ),
                SizedBox(height: 20,),
                Text('cross leg side bend right',style: TextStyle(fontWeight:FontWeight.w600,fontSize: 30),),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 45,vertical: 25),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('00',style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),),
                        Text(':',style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),),
                        Consumer<NewZeroToThirty>(builder: (BuildContext context, value, Widget? child) {
                          return Text(value.fivecount<10?'0${value.fivecount.toString()}':value.fivecount.toString(),style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),);
                        },)
                      ],
                    )
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<NewZeroToThirty>(
                  builder: (BuildContext context, value, Widget? child) {
                    return InkWell(
                      onTap:(){
                        value.visibletrue();
                      } ,
                      child: Container(
                        height: 60,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text('PAUSE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),)),
                      ),
                    );
                  },

                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [InkWell(onTap: (){},child: Text('PREVIOUS',style: TextStyle(color: Colors.black,fontSize: 20))),
                      InkWell(onTap: (){},child: Text('SKIP',style: TextStyle(color: Colors.black,fontSize: 20))),
                    ],
                  ),
                ),
                Divider(thickness: 2,),
                Align(alignment:Alignment.bottomLeft,child:Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                    child: Text('Next: DAND BETHAK',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),),

              ],
            ),
            Consumer<NewZeroToThirty>(builder: (BuildContext context, value, Widget? child) {
              return  Visibility(
                  visible: value.isvisible,
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
                        SizedBox(height: 10,),
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
                        SizedBox(height: 10,),
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
                        SizedBox(height: 10,),
                        Consumer<NewZeroToThirty>(
                          builder: (BuildContext context, value, Widget? child) {
                            return InkWell(
                              onTap: (){
                                value.visiblefalse();
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
                                child: Center(
                                    child: Text('RESUME',
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.blueAccent,
                                            fontWeight: FontWeight.bold))),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ));;
            },)
          ],
        ),
      ),
    );
  }
}
