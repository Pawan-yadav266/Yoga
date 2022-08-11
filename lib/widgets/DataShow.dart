import 'package:flutter/material.dart';

class DataShow extends StatelessWidget {
  const DataShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> text1=["1","120","26"];
    List<String> text2=["Streak","Kcal","Minutes"];

    return Container(
        margin: const EdgeInsets.only(top: 100, left: 8, right: 8, bottom: 10),
        height: 100,
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90), color: Colors.blue),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                3,
                (index) => Container(
                  margin: EdgeInsets.only(top: 20),
                        child: Column(
                      children: [
                        Text(
                          text1[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        Text(
                          text2[index],
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Colors.white),
                        )
                      ],
                    )))));
  }
}
