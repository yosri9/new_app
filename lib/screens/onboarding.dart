import 'dart:core' as prefix0;
import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

import '../pagemodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'homescreen.dart';
class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<PageModel> pages;
  ValueNotifier<int> _pageViewNotifier= ValueNotifier(0);

  void _addPages() {
    pages= List<PageModel>() ;
    pages.add(PageModel(
        "welcome", 'adqsdqsdqsdqsdqsd   qsdqsdqs dqsd ', Icons.ac_unit,
        "assets/images/bg.jpg"));
    pages.add(PageModel(
        'alarm', 'adqsdqsdqsdqsdqsd   qsdqsdqs dqsd  ', Icons.access_alarms,
        "assets/images/bg3.jpg"));
    pages.add(PageModel("Map", 'dqsdlqdjdsf iid squd qsd ', Icons.print,
        "assets/images/bg4.jpg"));
    pages.add(PageModel("print", 'dqùjsdùsqd ùqskodpùsd48', Icons.map,
        "assets/images/bg2.jpg"));
  }


  @override
  Widget build(BuildContext context) {
    _addPages();
    return Stack(
        children: <Widget>[
          Scaffold(

              body: Stack(
                children: <Widget>[
                  Scaffold(
                    body: PageView.builder(
                      itemBuilder: (context, index) {
                        return Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: ExactAssetImage(pages[index].images),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Align(
                              alignment:Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Transform.translate(
                                    child: Icon(
                                      pages[index].icons,
                                      size: 150,
                                      color: Colors.white,
                                    ),
                                    offset: Offset(0, -100),
                                  ),
                                  Text(
                                    pages[index].titles,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 48, right: 48, top: 18),
                                    child: Text(pages[index].description
                                      , style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: pages.length,
                      onPageChanged: (index){
                        _pageViewNotifier.value=index;
                        
                      },
                    ),

                  ),
                  Transform.translate(
                    offset: Offset(0, 175),
                    child: Align(
                        alignment: Alignment.center,
                        child: _displayPageIndicator(pages.length)
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 24, left: 16, right: 16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.red.shade800,
                          child: Text(
                            'GET STARTED',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                letterSpacing: 2
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  _updateSeen();
                                  return homescreen();
                              },),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              )
          )
        ]

    );
  }
// ignore: missing_return


Widget _displayPageIndicator(int length){
  return PageViewIndicator(
    pageIndexNotifier: _pageViewNotifier,
    length: length,
    normalBuilder: (animationController, index) => Circle(
      size: 8.0,
      color: Colors.grey,
    ),
    highlightedBuilder: (animationController, index) => ScaleTransition(
      scale: CurvedAnimation(
        parent: animationController,
        curve: Curves.ease,
      ),
      child: Circle(
        size: 12.0,
        color: Colors.red,
      ),
    ),
  );
}

  void _updateSeen() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setBool('seen' , true) ;
  }

}

