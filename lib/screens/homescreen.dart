import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'home_tabs/whats_new.dart';
import 'home_tabs/favourites.dart';
import 'home_tabs/popular.dart';
import 'package:news_app/api/authors_api.dart';
import 'package:news_app/api/categories_api.dart';

class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}
enum PopOutMenu{ HELP ,ABOUT, CONTACT,SETTING }

class _homescreenState extends State<homescreen> with SingleTickerProviderStateMixin {
  
  TabController _tabController;
  CategoriesAPI categoriesAPI=CategoriesAPI();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController= TabController(initialIndex: 0,length: 3, vsync: this) ;
    
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
       centerTitle: false,
       actions: <Widget>[
         IconButton(icon: Icon(Icons.search), onPressed: (){}),
         _popOutMenu(context),

       ],
       bottom:  TabBar(
         indicatorColor: Colors.blue,
         tabs: [
         Tab(text: "what's New",),
         Tab(text: "POPULAR",),
         Tab(text: "FAVOURITE",),

       ], controller:  _tabController,),

       // backgroundColor: Colors.red,
      ),
      drawer:  NavigationDrawer(),
      body: Center(
        child: TabBarView(children: [
          WhatsNew(),
          Popular(),
          Favourites(),
        ], controller:  _tabController,)
      ),

    );
  }

  Widget _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(itemBuilder: (context){
      return [
        PopupMenuItem <PopOutMenu>(
          value:PopOutMenu.ABOUT,
          child:Text("ABOUT")
        ),
      PopupMenuItem <PopOutMenu>(
      value:PopOutMenu.CONTACT,
        child:Text("CONTACT")
      ),
      PopupMenuItem <PopOutMenu>(
       value:PopOutMenu.HELP,
        child:Text("HELP"),
        ),
        PopupMenuItem <PopOutMenu>(
        value:PopOutMenu.SETTING,
        child:Text("SETTING"),


        )];
    }, onSelected: (PopOutMenu menu){

    },
    );
  }
}
