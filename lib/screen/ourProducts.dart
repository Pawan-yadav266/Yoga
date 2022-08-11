import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yoga_new/screen/upLoad.dart';
import 'package:yoga_new/services/Mmodel.dart';

class OurProducts extends StatefulWidget {
  const OurProducts({Key? key}) : super(key: key);

  @override
  State<OurProducts> createState() => _OurProductsState();
}

class _OurProductsState extends State<OurProducts> {

  late Mmodel d;
  List<Mmodel> PostList = [];
  Future<List<Mmodel>> getPostApi() async
  {
    final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var data = jsonDecode(response.body);

    if(response.statusCode == 200)
      {
        for(Map i in data)
          {
            PostList.add(Mmodel.fromJson(i));
          }
        print(PostList);
        return PostList;
      }
    else
      {
        print("error aa gaya");
        return PostList;
      }


  }

  @override
  Widget build(BuildContext context) {
    print(getPostApi());
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>AddItem()));
          }, icon: Icon(Icons.upload))
        ],
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [

            Expanded(
              child: FutureBuilder(
                future: getPostApi(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  print("chal gaya");
                  if(!snapshot.hasData)
                    {
                      return Stack(
                        children: [
                          LinearProgressIndicator(minHeight: 9,),
                          Center(child: CircularProgressIndicator())
                        ],
                      );
                    }
                  else
                    {
                      return ListView.builder(
                        itemCount: PostList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              minLeadingWidth: 70,
                              leading: Image.network(PostList[index].image.toString(),width: 60,),
                              trailing: Text(PostList[index].price.toString()),
                              title: Text(PostList[index].title.toString()),
                            )
                          );
                        },);
                    }

                },),
            )

          ],
        ),
      ),
    );
  }
}
