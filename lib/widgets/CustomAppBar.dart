import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  AnimationController animationController;
  Animation colorsAnim, homeAnim, yogaAnim, iconAnim, drawerAnim;

  Function()? onPressed;

  CustomAppBar(
      {Key? key, required this.animationController,
      required this.onPressed,
      required this.colorsAnim,
      required this.drawerAnim,
      required this.homeAnim,
      required this.iconAnim,
      required this.yogaAnim}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child) {
          return AppBar(
            leading: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.dehaze,
                color: drawerAnim.value,
              ),
            ),
            backgroundColor: colorsAnim.value,
            elevation: 0,
            title: Row(
              children: [
                Text(
                  'HOME',
                  style: TextStyle(
                      color: homeAnim.value,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  ' YOGA',
                  style: TextStyle(
                      color: yogaAnim.value,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            actions: [
              Icon(Icons.notifications,color: iconAnim.value,),
              const Padding(
                padding: EdgeInsets.only(top: 10,right: 10),
                child: CircleAvatar(backgroundColor: Colors.green,),
              )
            ],
          );
        },
      ),
    );
  }
}
