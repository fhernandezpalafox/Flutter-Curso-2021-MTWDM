import 'package:app_lugares_customwidgets/pages/HomePage.dart';
import 'package:flutter/material.dart';


class BottonNavigationAndroid extends StatefulWidget {

  @override
  _BottonNavigationAndroidState createState() => _BottonNavigationAndroidState();
}

class _BottonNavigationAndroidState extends State<BottonNavigationAndroid> {
  
  int indexTap = 0;

  final List<Widget> widgetsChildren = [
    HomePage(),
    Text("Search"),
    Text("Profile"),
  ];

  void ontapTapped(int index){
    setState(() {
      indexTap = index;
    });
  }



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.purple
        ),
        child: BottomNavigationBar(
          currentIndex: indexTap,
          onTap: ontapTapped,
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
          ],
        ),
      ),
    );
  }
}