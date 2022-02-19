import 'package:flutter/material.dart';

//Primera App
void main2(){
   runApp(
     MaterialApp(
       theme: ThemeData(
         primarySwatch: Colors.orange
       ),
       title: 'Mi primera app',
       home: Scaffold(
         appBar: AppBar(
           title: Text('Primera Aplicación'),
         ),
         body: Container(
           child: Center(
             child: Text('Hola MTW'),
           ),
         ),
       ),
     )
   );
}

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page Counter',),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
 int _counter = 0;


void _incrementCounter(){
  setState(() {
    _counter++;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
             child: Column(
                mainAxisAlignment: MainAxisAlignment.center,    
                children: [
                  Text('You have pushed the button this many times: '),
                  Text('$_counter', style: TextStyle(
                        fontSize: 60.0
                    )
                  )
                ],
             )
         ),
       floatingActionButton: FloatingActionButton(
         onPressed: _incrementCounter,
         tooltip: 'Increment',
         child: Icon(Icons.add),
       ),  
    );
  }
}




