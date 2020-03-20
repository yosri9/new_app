import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _drawHeader(),
            _drawTopStories() ,


          ],
        ),
      ),
    );
  }
  Widget _drawHeader(){
    TextStyle _headerTitle= TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w600
    );
    TextStyle _headerDescription = TextStyle(
      color: Colors.white,
      fontSize: 18
    ) ;

    return Container(
        width: MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.height*0.25,
        decoration: BoxDecoration(
          image:DecorationImage(
              image: ExactAssetImage('assets/images/bg.jpg'),
              fit:BoxFit.cover

          ),

        ),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("sdqdqsqsdqsddsf", style: _headerTitle,textAlign: TextAlign.center,),
                SizedBox(height:8,),
                Padding(
                  padding: const EdgeInsets.only(left:34 , right: 34),
                  child: Text("sdqdqsqsdqsdsssssssssssss ssdsssssssssssssssssssdsf",style: _headerDescription,textAlign: TextAlign.center,),
                ),
              ],
            )
        )
    ) ;
  }

  Widget _drawTopStories() {
  return Container(
    color: Colors.grey.shade100,
    child: Column(
      crossAxisAlignment:  CrossAxisAlignment.start,

      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16 , top: 16),
          child: _drawSectionTitle('top stories'
          ),
        ) ,
        Padding(
          padding: EdgeInsets.all(8),
          child: Card(
            child: Column(
              children: <Widget>[
                _drawSingleRow(),
                _drawDivider(),
                _drawSingleRow(),
                _drawDivider(),
                _drawSingleRow(),
              ],
            ),
          ),



        ),
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 8, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _drawSectionTitle('Recent Updates'),
               _drawRecentUpdatesCard(Colors.deepOrange),
              _drawRecentUpdatesCard(Colors.teal),
              SizedBox(
                height: 48,
              )
            ],
          ),
        )
      ],
    ),
  );
  }
  Widget _drawSingleRow(){
    return
      Padding(
        padding: EdgeInsets.all(8) ,
        child: Card(
          child: Column(
              children : <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        child: Image(image:  ExactAssetImage('assets/images/bg2.jpg') ,
                          fit: BoxFit.cover,
                        ),
                        width: 124,
                        height: 124,
                      ),
                      SizedBox(width: 16,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                          children: <Widget>[
                            Text('fdsfqfghdghdghhhhhhrtrhtrhtheh thrheth',
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('fgdfgsfg'),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.timer) ,
                                    Text('15 min', )
                                  ],
                                )

                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]
          ),
        ),
      )
      ;
  }

 Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade100,
    );
 }

 Widget _drawSectionTitle(String title) {
    return Text(
        title,
        style :TextStyle(
        color: Colors.grey.shade700 ,
        fontWeight: FontWeight.w600,
        fontSize: 18,
    )
    );
  }

  Widget _drawRecentUpdatesCard(Color Color) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('assets/images/bg4.jpg'),
                fit: BoxFit.cover,
              )
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.25,

          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.only(left: 24 , right: 24 ,top: 4 , bottom: 0.1),
              decoration: BoxDecoration(
                color: Color,
                borderRadius: BorderRadius.circular(4)
              ),

              child: Text(
                'Sport' ,
                style: TextStyle(
                    color: Colors.white ,
                    fontWeight: FontWeight.w500,
                ),),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 0, left: 16 ,right: 16 ,bottom: 8),
              child: Text('Vettel is ferrari number one - hamilton',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
              ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 16, right: 16 ,top: 8, bottom: 16),
              child: Row(
                children: <Widget>[
                  Icon(
                   Icons.timer,
                   color: Colors.grey,
                    size: 18,
                  ),
                  SizedBox(width:8,),
                  Text(
                      '15 Min',
                      style: TextStyle(
                        color:Colors.grey,
                        fontSize: 14
                      ),

                  )
                ],
              ),
          )
        ],
      ),
      
    );
  }

}

