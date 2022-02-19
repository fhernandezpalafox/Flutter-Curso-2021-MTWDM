import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_lugares_customwidgets/pages/HomePage.dart';

class BottonNavigationiOS extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
           BottomNavigationBarItem(
             icon: Icon(Icons.home , color:Colors.indigo),
             label: 'Home'
           ),

           BottomNavigationBarItem(
             icon: Icon(Icons.search , color:Colors.indigo),
             label: 'Search'
           ),
            
           BottomNavigationBarItem(
             icon: Icon(Icons.person , color:Colors.indigo),
             label: 'Profile'
           ) 

          ]
        ),
        tabBuilder: (BuildContext contex, int index) {
          switch (index) {
            //TODO Modificar el home por una Page
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomePage(),
              );
              break;
              case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => Text("Search"),
              );
              break;
              case 2:
              return CupertinoTabView(
                builder: (BuildContext context) => Text("Profile"),
              );
              break;
            default:
          }
        },
      ),  
    );
  }
}