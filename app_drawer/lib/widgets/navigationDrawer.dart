import 'package:flutter/material.dart';

import 'package:app_drawer/pages/primer_page.dart';
import 'package:app_drawer/pages/segundo_page.dart';


class NavigationDrawer extends StatefulWidget {

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Felipe Hernandez"),
            accountEmail: Text("felipe@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: FlutterLogo(size: 42.0,),
            ),
          ),
          Ink(
            color: Colors.blue,
            child: ListTile(
              leading: Icon(Icons.home,color:Colors.white),
              title: Text("Titulo", style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => PrimerPage()
                      )
                  );
              },
            ),
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.delete),
              title: Text("Segundo item",),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SegundoPage()
                      )
                  );
              },
            )
        ],
      ),
    );
  }
}