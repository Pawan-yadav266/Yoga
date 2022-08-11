import 'package:flutter/material.dart';
import 'package:yoga_new/screen/Home.dart';
import '../services/newDb.dart';

class Finish extends StatelessWidget {
  const Finish({Key? key}) : super(key: key);

  Future insert()async{
    int? i = await DatabaseService.databaseService.insert({
        DatabaseService.columnName1 : DateTime.now().year.toString() ,
        DatabaseService.columnName2 : DateTime.now().month.toString(),
        DatabaseService.columnName3 : DateTime.now().day.toString()
      });
      print('this is i $i');
  }



  @override
  Widget build(BuildContext context) {
    insert();
    return WillPopScope(
      onWillPop: () async { Navigator.push(context, MaterialPageRoute(builder: (_)=>Home())); return true; },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Container(
              height: 250,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl1qMFT9Eb0p93rM8LyvlGoexdGJBW1w40ow&usqp=CAU')
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('125',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
                      Text('KCal',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    children: [
                      Text('12',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                      Text('Minutes',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('DO IT AGAIN',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                  Text('SHARE',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500))
                ],
              ),
            ),
            Divider(thickness: 2,),
            Container(
              child: Column(
                children: [

                  ElevatedButton(onPressed: (){}, child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 22),
                    child: Text('Rate Our App',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                  ),)
                ],
              ),
            ),
            SizedBox(height: 9,),

          ],
        ),
      ),
    );
  }
}
