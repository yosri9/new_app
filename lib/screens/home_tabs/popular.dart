import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder:  (context, position){
          return Card(
            child: _drawSingleRow() ,
          );
    },
    itemCount: 20,
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
}
