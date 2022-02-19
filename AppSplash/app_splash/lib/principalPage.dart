import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key key}) : super(key: key);


 static Route<dynamic> route() {
        return MaterialPageRoute(
          builder:(context) => PrincipalPage()
    );
 }


  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
      ),
      body: Container(
       child: Center(
         child: Text('Bienvenido...'),
       ),
      ),
    );
  }
}
