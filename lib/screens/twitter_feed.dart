import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Twitter Feeds") ,
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: null)
        ],
      ),
      drawer:NavigationDrawer() ,
      body: ListView.builder(itemBuilder: (context,position){
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Card(
            child: Column(
              children: <Widget>[
                _cardHeader(),
                _cardBody(),
                _drawLine(),
                _cardFooter(),
              ],
            ),
          ),
        );
      },
        itemCount:20
      ),
    );
  }
  Widget _cardHeader(){

    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircleAvatar(
              backgroundImage: ExactAssetImage( "assets/images/bg2.jpg"),
              radius: 24
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Christina Meyers', style:TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  )
                ) ,
                SizedBox(width: 8,),
                Text('@ch_meyers' , style: TextStyle(color: Colors.grey),) ,
              ],
            ),
            SizedBox(height: 8,),
            Text('fri , 12 may 2017 * 14.30')
          ],
        )
      ],

    );
  }
  Widget _cardBody(){
    return Padding(
      padding: const EdgeInsets.only(left: 40 , bottom: 8),
      child: Text(' wesdusq osdksd k^psodkp^qsokd ôkdsoqdssssssk q sdddddddddddd sqdqsds',
      style: TextStyle(fontSize: 16,
          height: 2,
          color: Colors.orange.shade900,
      ),
      ),
    );
  }
  Widget _cardFooter(){
   return Padding(
     padding: const EdgeInsets.all(16),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: <Widget>[
         Row(children: <Widget>[
           IconButton(
               icon: (Icon(Icons.repeat , size: 28,)),
               color: Colors.orange ,
               onPressed: (){}),
           Text(
             '25',
             style: TextStyle(
                 color: Colors.grey,
                 fontSize: 16,
             ),

           ),

         ],

         ),
         Row(
           children: <Widget>[
             FlatButton(
                 onPressed: (){},
                 child: Text(
                   'SHARE',
                   style: TextStyle(
                       color: Colors.orange
                   ),
                 )
             ),
             FlatButton(onPressed: (){}, child: Text('Open', style: TextStyle(color: Colors.orange),))

           ],
         )
       ],
     ),
   );
  }

  _drawLine() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
      margin: EdgeInsets.only(top:16),
    );
  }
}
