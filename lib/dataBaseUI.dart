import 'package:flutter/material.dart';
import 'package:yoga_new/screen/ausemCalamder.dart';
import 'package:yoga_new/services/newDb.dart';

class DataBaseUi extends StatefulWidget {
  const DataBaseUi({Key? key}) : super(key: key);

  @override
  State<DataBaseUi> createState() => _DataBaseUiState();
}

class _DataBaseUiState extends State<DataBaseUi> {
  bool isvisible= false;
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
  DateTime date = new DateTime(now.year, now.month, now.day);
    return Scaffold(
      appBar: AppBar(title: Text('Sqflite'),centerTitle: true,),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: ()async{
             int? i = await DatabaseService.databaseService.insert({
               DatabaseService.columnName1 : now.year.toString(),
               DatabaseService.columnName2 : now.month.toString(),
               DatabaseService.columnName3 : now.day.toString()
             });
             Future.delayed(Duration(seconds: 5));print("inserte id is $i");
            }, child: Text('Insert'),),
            ElevatedButton(onPressed: ()async{
              List<DateTime> n = await DatabaseService.databaseService.queryAll();

              // print(queryRows);

            }, child: Text('query')),
            ElevatedButton(onPressed: (){}, child: Text('update')),
            ElevatedButton(onPressed: (){}, child: Text('delete')),


            Visibility(
              visible: isvisible,
                child: SizedBox(
              height: 300,
              width: 300,

            ))

          ],
        ),
      ),
    );
  }
}
