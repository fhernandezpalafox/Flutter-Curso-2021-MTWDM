import 'package:app_navegacion/modelo/Persona.dart';
import 'package:app_navegacion/pages/SegundaPage.dart';
import 'package:flutter/material.dart';

class DetallePersonaPage extends StatelessWidget {
 
 final Persona objPersona; 

  const DetallePersonaPage({Key key, @required this.objPersona}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${objPersona.nombre}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            child: Column(
              children: [
                Text('${objPersona.descripcion}'),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(onPressed: (){
                   Navigator.push(context, 
                   MaterialPageRoute(builder:
                      (context) =>  SegundaPage(objPersona.nombre)));
                },
                child: Text('Siguiente'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}