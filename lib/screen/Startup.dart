import 'package:flutter/material.dart';
import 'package:yoga_new/screen/AreYouReady.dart';

class Startup extends StatefulWidget {
  const Startup({Key? key}) : super(key: key);

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:ElevatedButton(

        onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>AreYouReady()));
        } ,
        child: Container(padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),child: Text('START',style: TextStyle(fontSize: 20),)),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Yoga for Beginner'),
              collapseMode: CollapseMode.parallax,
              centerTitle: true,
              background: Image.network(
                'https://images.unsplash.com/photo-1561049501-e1f96bdd98fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.cover,
              ),
            ),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up))],
          ),
          SliverToBoxAdapter(
              child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '10 Mins || 26 Workouts',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(thickness: 2);
                  },
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Container(
                        margin: EdgeInsets.only(right: 8),
                        child: Image.network(
                          'https://intranet.cb.amrita.edu/sites/default/files/inline-images/surya-namaskar.gif',
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        'Yoga ${index}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Text(
                        (index % 20 == 0) ? '00:20' : "x20",
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  },
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
