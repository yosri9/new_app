import 'dart:math';

import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List <Color> colorsList=[
    Colors.red,
    Colors.teal,
    Colors.deepOrange,
    Colors.indigo,
    Colors.purple
  ];
  Random random= Random();
  Color _getRandomColor(){
    return colorsList[
    random.nextInt(colorsList.length)
    ] ;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,position) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              child: Column(
                children: <Widget>[
                  _authorRow(),
                  SizedBox(height: 16,),
                  _newItemRow(),
                ],
              ),
            ),
          ),

        );
      } ,
      itemCount:20 ,
    );
  }
  Widget _authorRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

      Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover
              ),
              shape: BoxShape.circle,


            ),
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Michael Adams', style: TextStyle(color:Colors.grey),),
              SizedBox(height: 8,),
              Row(
                children: <Widget>[
                  Text("15 min .",style: TextStyle(color: Colors.grey),),
                  Text(
                    'Life Style',
                    style: TextStyle(
                        color: _getRandomColor()
                    ),
                  )
                ],
              )


            ],
          ),
        ],
      ),

        IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: null,
          color: Colors.grey,
        ),
      ],
      
    );
  }

  Widget _newItemRow(){
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover
            ),


          ),
          width: 124,
          height: 124,
          margin: EdgeInsets.only(right: 16),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('dazdazd azodk azdl hfghhg gfhgfazpdlzd',
                style: TextStyle(

                  fontSize: 18 ,
                  fontWeight: FontWeight.w600
                ),

              ),
              Text('dqsdqsd sdqsd sdlkdui qsdm sdggggggggggggggggggggggggggggijqsjd',
              style: TextStyle(
                color: Colors.grey ,
                fontSize: 16,
                height:1.5
              ),
              )
            ],
          ),
        )
      ],
    ) ;

  }
}
