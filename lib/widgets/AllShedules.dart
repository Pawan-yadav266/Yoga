import 'package:flutter/material.dart';
import 'package:yoga_new/screen/Startup.dart';

class AllShedules extends StatelessWidget {
  const AllShedules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = ['one', 'two', 'three'];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              'Yoga For ALL',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
              children: List.generate(
                  3,
                  (index) => InkWell(
                        onTap: () {
                          if(index==0){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return Startup();
                          }));}
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          height: 200,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/yoga-${images[index]}.jpg'))),
                          child: Container(
                            color: Colors.black.withOpacity(0.2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 10, top: 10),
                                    child: Text(
                                      'Weight Lose Yoga',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Last time: 1 Feb',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: Colors.white),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      )))
        ],
      ),
    );
  }
}
