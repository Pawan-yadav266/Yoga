import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yoga_new/widgets/CustomAppBar.dart';
import 'package:yoga_new/widgets/AllShedules.dart';

import '../services/newDb.dart';
import '../widgets/CustomDrawer.dart';
import '../widgets/DataShow.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorAnim, _homeAnim, _yogaAnim, _iconAnim, _drewerAnim;
  late AnimationController _textAnimationController;
  DateTime now = DateTime.now();
  List<DateTime> n = [];

  Calander()async{
    // int? i = await DatabaseService.databaseService.insert({
    //   DatabaseService.columnName1 : now.year.toString(),
    //   DatabaseService.columnName2 : now.month.toString(),
    //   DatabaseService.columnName3 : now.day.toString()
    // });
    // print('this is i $i');

     n = await DatabaseService.databaseService.queryAll();
    print(n);
    setState(() {

    });
  }


  @override
  void initState() {
    Calander();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _textAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorAnim = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(_animationController);
    _iconAnim = ColorTween(begin: Colors.white, end: Colors.lightBlue)
        .animate(_animationController);
    _homeAnim = ColorTween(begin: Colors.white, end: Colors.blue)
        .animate(_animationController);
    _yogaAnim = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _drewerAnim = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _animationController.addListener(() {
      print(_animationController.value);
    });
    super.initState();

  }




  bool ScrollListner(ScrollNotification scrollNotification) {
    bool scroll = false;
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollNotification.metrics.pixels / 110);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textAnimationController.dispose();

    // ignore: avoid_print
    print('Dispose used');
    super.dispose();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(list: n,),
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification: ScrollListner,
        child: Stack(
          children: [
            Container(
              height: double.maxFinite,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            DataShow(),
                            AllShedules(),
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomAppBar(
                      animationController: _animationController,
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      colorsAnim: _colorAnim,
                      drawerAnim: _drewerAnim,
                      homeAnim: _homeAnim,
                      iconAnim: _iconAnim,
                      yogaAnim: _yogaAnim)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
