import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/screens/facebook_feeds.dart';
import 'package:news_app/screens/instagram_feed.dart';
import 'package:news_app/screens/twitter_feed.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'package:news_app/models/nav_menu.dart';
import 'package:news_app/screens/homescreen.dart';
import 'package:news_app/screens/headline_news.dart';
import 'package:news_app/utilities/app_utilities.dart';
import 'package:news_app/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';



class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
    static bool isLoggedIn=false;
    String token;
    SharedPreferences sharedPreferences;
  List<NavMenuItem> navigationMenu=[
    NavMenuItem("Explore",()=> homescreen() ),
    NavMenuItem("headLine News" ,()=> HeadLineNews()),
    NavMenuItem("Twitter Feeds", ()=> TwitterFeed()),
    NavMenuItem("Instagram Feeds", ()=>InstagramFeed()),
    NavMenuItem("Facebook Feeds", ()=>FacebookFeeds()),
   // NavMenuItem("Login", ()=>Login()),

    //NavMenuItem("Login",()=>FacebookFeeds()),
    //NavMenuItem("Register",()=>FacebookFeeds()),
  ];
  _checkToken()async{
     sharedPreferences= await SharedPreferences.getInstance();
    token=sharedPreferences.get('token');
   setState(() {
     if(token==null){
       isLoggedIn=false ;

     }else{
       isLoggedIn=true;
     }
   });
  }
  _logout(){
    if(this.mounted){
      if(sharedPreferences!=null){
        sharedPreferences.remove('token');
    }
  return homescreen();
  }
  }
  @override
  void initState(){
    super.initState();
    if(isLoggedIn){
      navigationMenu.add(NavMenuItem("Logout", _logout));
    }


  }
  Widget build(BuildContext context) {
    if(this.mounted){
      _checkToken();
    }
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

