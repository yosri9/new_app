import 'package:flutter/material.dart';
import 'package:news_app/screens/facebook_feeds.dart';
import 'package:news_app/screens/instagram_feed.dart';
import 'package:news_app/screens/twitter_feed.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'package:news_app/models/nav_menu.dart';
import 'package:news_app/screens/homescreen.dart';
import 'package:news_app/screens/headline_news.dart';


class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  List<NavMenuItem> navigationMenu=[
    NavMenuItem("Explore",()=> homescreen() ),
    NavMenuItem("headLine News" ,()=> HeadLineNews()),
    NavMenuItem("Twitter Feeds", ()=> TwitterFeed()),
    NavMenuItem("Instagram Feeds", ()=>InstagramFeed()),
    NavMenuItem("Facebook Feeds", ()=>FacebookFeeds()),
  ];
  List <String> navMenu=[
    'Explore',
    'Headline News',
    'Read Later',
    'Videos',
    'Photos' ,
    'Setting',
    'Logout',
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 75 ,left: 24),
        child: ListView.builder(
            itemBuilder: (context,position){
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(navigationMenu[position].title,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 22,
                  ),
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push((context), MaterialPageRoute(builder: (context)=>
                       navigationMenu[position].destination() ));

                      }
                    )
                    );

                  },
          itemCount: navigationMenu.length,

        ),
              )
        );

}



  }

