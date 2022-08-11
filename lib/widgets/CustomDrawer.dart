import 'package:flutter/material.dart';
import 'package:yoga_new/screen/ausemCalamder.dart';

class CustomDrawer extends StatefulWidget {
  final List<DateTime> list;
  CustomDrawer({Key? key,required this.list}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 50,
      child: MyHomePage(list: widget.list),
    );
  }
}

