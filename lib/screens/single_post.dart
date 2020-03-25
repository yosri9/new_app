import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/models/post.dart';
class SinglePost extends StatefulWidget {
  final Post post;

  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.post.featuredImage),
                            fit: BoxFit.cover
                        )
                    )
                ),
              ),


            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 1500,
                  )
                ],
              ),
            ),
            SliverList(
              // ignore: missing_return
                delegate: SliverChildBuilderDelegate((context, position) {
                  if (position == 0) {
                    return _drawPostDetails();
                  } else if (position >= 1 && position < 24) {
                    return _comments();
                  } else   {
                    return _commentTextEntry();



                  }
                }, childCount: 25
                )
            )
          ]
      ),
    );
  }

  final random = Random();

  /// Returns a random color, with minumim brightness level
  Color getRandomColor({int minBrightness = 50}) {
    assert(minBrightness >= 0 && minBrightness <= 255);
    return Color.fromARGB(
      0xFF,
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
    );
  }

  Widget _drawPostDetails() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
          widget.post.content,
        style: TextStyle(
          fontSize: 18,
          letterSpacing: 1.2,
            height: 1.25
        ),
      ),
    );
  }

  Widget _comments() {
  return  Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: ExactAssetImage("assets/images/bg2.jpg"),

            ),
            SizedBox(
              width: 16,

            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Christina'),
                Text('1 hour')
              ],
            )
          ],
        ),
      SizedBox(
        height: 16,
      ),
      Text("desciption")
      ],
    ),
  );
  }

  Widget _commentTextEntry() {
    return Container(
      color:  Color.fromRGBO(241, 245, 247, 1),

      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write Comment here!',

                    contentPadding: EdgeInsets.only(left: 16,top: 25, bottom: 32)

                  ),
                ),
              ),
              FlatButton(
                child: Text(
                    'SEND',
                style: TextStyle(
                  color: Colors.red,
                ),
                ),
                onPressed:() {},
              ),

            ],
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }

}