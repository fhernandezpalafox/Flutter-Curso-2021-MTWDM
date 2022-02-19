import 'package:app_splash/principalPage.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _timer;

@override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 5),_irPrincipal);
  }

@override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

void _irPrincipal(){
   if(mounted){
     Navigator.of(context).pushReplacement(PrincipalPage.route());
   }
}

  
  @override
  Widget build(BuildContext context) {
    return  Material(
       color: Colors.blue,
       child: Column(
         children: [
           SizedBox(height: 100.0),
           Flexible(
             flex:2,
             child: SafeArea(
               child: FractionallySizedBox(
                 widthFactor: 0.7,
                 child: Image.asset('assets/flutter.png'),
               ),
             ),
           ),
           Text('cargando...', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0
           ),
          ),
          Flexible(
            flex:2,
            child: SafeArea(
               child: Container(
                 padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
                 alignment: Alignment.bottomCenter,
                 child: CircularProgressIndicator(
                   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                 ),
               ),
            )
          )
         ],
       ),
    );
  }
}
