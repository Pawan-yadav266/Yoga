// ignore: import_of_legacy_library_into_null_safe
import 'dart:async';

import 'package:awesome_calendar/awesome_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_new/provider/calanderProvider.dart';
import 'package:yoga_new/provider/zeroToTHirty.dart';
import 'package:yoga_new/screen/ourProducts.dart';

import '../services/newDb.dart';


class MyHomePage extends StatefulWidget {
  final List<DateTime> list;
  const MyHomePage({Key? key,required this.list}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime initialDate = DateTime.now();

  DateTime? singleSelect;
  DateTime embeddedCalendar = DateTime.now();
  List<DateTime>? multiSelect;
  List<DateTime>? rangeSelect;
  List<DateTime>? multiOrRangeSelect;
  late List<DateTime> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // callFun();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) { return CalanderProvider(); },
        child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 60,),
                Text('This Month Record',style: TextStyle(color: Colors.pink,fontSize: 20),),
                Consumer<CalanderProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return value.isCalander?AwesomeCalendarDialog(
                      selectionMode: SelectionMode.multi,
                      selectedDates: widget.list,
                    ):CircularProgressIndicator();
                  },

                ),

                 ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>OurProducts()));
                 }, child: Text("out Products",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))

                ],
              ),
            ),
          ),
      ),
    );
  }


  Future<void> singleSelectPicker() async {
    final DateTime? picked = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return const AwesomeCalendarDialog(
          selectionMode: SelectionMode.single,
        );
      },
    );
    if (picked != null) {
      setState(() {
        singleSelect = picked;
      });
    }
  }

  Future<void> multiSelectPicker() async {
    final List<DateTime>? picked = await showDialog<List<DateTime>>(
      context: context,
      builder: (BuildContext context) {
        return const AwesomeCalendarDialog(
          selectionMode: SelectionMode.multi,
        );
      },
    );
    if (picked != null) {
      setState(() {
        multiSelect = picked;
      });
    }
  }

  Future<void> rangeSelectPicker() async {
    final List<DateTime>? picked = await showDialog<List<DateTime>>(
      context: context,
      builder: (BuildContext context) {
        return const AwesomeCalendarDialog(
          selectionMode: SelectionMode.range,
        );
      },
    );
    if (picked != null) {
      setState(() {
        rangeSelect = picked;
      });
    }
  }

  Future<void> multiOrRangeSelectPicker() async {
    final List<DateTime>? picked = await showDialog<List<DateTime>>(
      context: context,
      builder: (BuildContext context) {
        return const AwesomeCalendarDialog(
          selectionMode: SelectionMode.multi,
          canToggleRangeSelection: true,

        );
      },
    );
    if (picked != null) {
      setState(() {
        multiOrRangeSelect = picked;
      });
    }
  }

  Future<void> pickerWithTitle() async {
    await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return const AwesomeCalendarDialog(
          selectionMode: SelectionMode.single,
          title: Padding(
            padding: EdgeInsets.all(16),
            child: Text('This is a custom title'),
          ),
        );
      },
    );
  }

  Future<void> pickerWithCustomDateRange() async {
    await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return AwesomeCalendarDialog(
          selectionMode: SelectionMode.single,
          startDate: DateTime(2022),
          endDate: DateTime(2022, 12),
        );
      },
    );
  }
}


class ModalClass {
  bool isvisible=false;
  List<DateTime>? list;

  ModalClass m = ModalClass();


}

class CustomDayTileBuilder extends DayTileBuilder {
  CustomDayTileBuilder();

  @override
  Widget build(BuildContext context, DateTime date,
      void Function(DateTime datetime)? onTap) {
    return DefaultDayTile(
      date: date,
      onTap: onTap,
      selectedDayColor: Colors.cyan,
      currentDayBorderColor: Colors.grey,
    );
  }
}