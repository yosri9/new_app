import 'dart:math';
import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/posts-api.dart';
import 'dart:async';
import 'package:news_app/models/post.dart';
import 'package:news_app/utilities/data_utilities.dart';
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

    return FutureBuilder(
      future: postsAPI.fetchPostsByCategoryId("1"),
    // ignore: missing_return
    builder: (context ,AsyncSnapshot snapShot){
     switch(snapShot.connectionState){
       case ConnectionState.waiting:
         return loading();
         break;
       case ConnectionState.active:
         return loading();
         break;
       case ConnectionState.done:

         if (snapShot.hasError){
             return error(snapShot.error);
           }else{
            List<Post> posts= snapShot.data;
            Random random = Random();
            int randomIndex = random.nextInt(posts.length);
            Post post =posts[randomIndex];
            return Container(
                width: MediaQuery.of(context).size.width,
                height:  MediaQuery.of(context).size.height*0.25,
                decoration: BoxDecoration(
                  image:DecorationImage(
                      image:NetworkImage(post.featuredImage),
                      fit:BoxFit.cover

                  ),

                ),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 46 , right: 46),
                           child: Text(post.title, style: _headerTitle,textAlign: TextAlign.center,),
                    ),
                      SizedBox(height:8,),


                      Padding(
                          padding: const EdgeInsets.only(left:34 , right: 34),
                          child: Text(
                            post.content.substring(0,75),
                              style: _headerDescription,
                            textAlign: TextAlign.center
                          ),
                        ),
                      ],
                    )
                )
            );
           }
         break;


       case ConnectionState.none:
         error(snapShot.error);
         break;

     }

    }
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

              future: postsAPI.fetchPostsByCategoryId("1"),
              // ignore: missing_return
              builder:(context,AsyncSnapshot snapShot ){

                switch(snapShot.connectionState){
                  case ConnectionState.waiting:
                    return loading();
                    break;
                  case ConnectionState.active:
                    return loading();
                    break;
                  case ConnectionState.done:
                    if (snapShot.error!=null){
                    return error(snapShot.error);
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
                          return noData();
                        }

                      }else{
                       return noData()   ;
                      }
                    }
                    break;
                  case ConnectionState.none:
                  return connectionError();
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
      padding: EdgeInsets.all(8),
      child: FutureBuilder(
        // ignore: missing_return
        future: postsAPI.fetchPostsByCategoryId("2"),
        // ignore: missing_return
        builder:(context , AsyncSnapshot snapShot) {
          switch (snapShot.connectionState){
            case ConnectionState.none:
              return connectionError();
              break;
            case ConnectionState.active :
              return loading();
              break;
            case ConnectionState.waiting:
              return loading();
              break;
            case ConnectionState.done:
              if (snapShot.hasError){
                return error(snapShot.error);
              }else{
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _drawSectionTitle('Recent Updates'),
                    _drawRecentUpdatesCard(Colors.deepOrange,snapShot.data[0]),
                    _drawRecentUpdatesCard(Colors.teal,snapShot.data[1]),
                    SizedBox(
                      height: 48,
                    )
                  ],
                );

              }
              break;
          }
        }
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
                                    Text(parseHumanDateTime(post.dateWritten) ),
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

  Widget _drawRecentUpdatesCard(Color color , Post post) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(post.featuredImage),
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
                color: color,
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
              child: Text(post.title,
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
                      parseHumanDateTime(post.dateWritten),
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

