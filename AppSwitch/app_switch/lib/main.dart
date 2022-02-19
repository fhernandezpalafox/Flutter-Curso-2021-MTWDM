import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Switch'),
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

//propiedades
bool isSwitched =  false;
String estado = 'Deshabilitado';
bool enabledTextField =  false;

//Métodos
void estadoSwitch(bool valor){
   estado = (valor == true)?'Habilitado':'Deshabilitado';
   enabledTextField =  valor;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Center(
                child: Switch(
                  value: isSwitched,
                  onChanged: (value){
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                      estadoSwitch(value);
                    });
                  },
                  activeColor: Colors.green,
                  activeTrackColor: Colors.lightGreenAccent
                ),
              ),
              Center(
                child: Text('Esta $estado'),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: TextField(
                    enabled: enabledTextField,
                    decoration: InputDecoration(
                      hintText: 'Captura un dato'
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ) 
    );
  }
}
