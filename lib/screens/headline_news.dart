import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

import 'home_tabs/favourites.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/whats_new.dart';
class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews> with TickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){})

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
            Favourites(),
            Popular(),
            Favourites(),
          ], controller:  _tabController,)
      ),

    );

  }
}
