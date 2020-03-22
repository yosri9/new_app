import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/posts-api.dart';
import 'dart:async';
import 'package:news_app/models/post.dart';
import 'package:timeago/timeago.dart' as timeago;
class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  
  PostsAPI postsAPI=PostsAPI();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _drawHeader(),
            _drawTopStories() ,
            _drawRecentUpdates(),


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
            child: FutureBuilder(

              future: postsAPI.fetchWhatsNew(),
              // ignore: missing_return
              builder:(context,AsyncSnapshot snapShot ){

                switch(snapShot.connectionState){
                  case ConnectionState.waiting:
                    return _loading();
                    break;
                  case ConnectionState.active:
                    return _loading();
                    break;
                  case ConnectionState.done:
                    if (snapShot.error!=null){
                    return _error(snapShot.error)
                    }else{
                      if(snapShot.hasData){
                        List<Post> posts=snapShot.data;

                        if (posts.length>3){
                          Post post1=snapShot.data[0];
                          Post post2=snapShot.data[1];
                          Post post3=snapShot.data[2];

                          return Column(
                            children: <Widget>[
                              _drawSingleRow(post1),
                              _drawDivider(),
                              _drawSingleRow(post2),
                              _drawDivider(),
                              _drawSingleRow(post3),
                            ],
                          );
                        }else{
                          return _noData();
                        }

                      }else{
                       return _noData()   ;
                      }
                    }
                    break;
                  case ConnectionState.none:
                  return _connectionError();
                    break ;
                }


              } ,

            ),
          ),



        ),

      ],
    ),
  );
  }
  Widget _drawRecentUpdates(){
    return Padding(
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
    );
  }
  Widget _drawSingleRow(Post post){
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
                        child: Image.network(post.featuredImage,
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
                            Text(
                              post.title,
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
                                    Text(_parseHumanDateTime(post.dateWritten) ),
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

  String  _parseHumanDateTime(String dateTime){
    Duration timeAgo =DateTime.now().difference(DateTime.parse(dateTime));
    DateTime theDifference=DateTime.now().subtract(timeAgo);
    return timeago.format(theDifference) ;
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

  Widget _loading() {
    return Container(
      padding: EdgeInsets.only(top: 16 , bottom: 16),
      child: Center(
        child:  CircularProgressIndicator(),
      ),
    )

  }
  Widget _noData(){
    return Container (
      padding: EdgeInsets.all(16),
      child:Text("No Data Available") ,
    );
  }
  Widget _error(var error){
    return Container (
      padding: EdgeInsets.all(16),
      child:Text(error.toString()) ,
    );
  }
  Widget _connectionError(){
    return Container (
      padding: EdgeInsets.all(16),
      child:Text("Connection Error!!!!") ,
    );
  }
}

