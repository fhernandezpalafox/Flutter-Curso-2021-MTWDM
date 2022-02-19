import 'package:flutter/material.dart';
import 'package:app_navegacion/modelo/Persona.dart';
import 'package:app_navegacion/pages/DetallePersonaPage.dart';

class NavegadorPage extends StatelessWidget {
  
  //TODO Lista personas
  final listaPersonas =  List<Persona>.generate(20, 
                  (i) => Persona('Persona $i','Descripcion $i'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista personas'),
      ),
      body: ListView.builder(
        itemCount: listaPersonas.length,
        itemBuilder: (contex,index) {
          
          bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
   
         //ListTile = Celda de la lista o Tabla   
         return ListTile(
           title:  Text(listaPersonas[index].nombre),
           subtitle: Text(listaPersonas[index].descripcion),  
           leading: Icon(Icons.account_circle, size: 50.0),
           trailing: (isIOS) 
               ? Icon(Icons.arrow_forward_ios)
               : Icon(Icons.arrow_forward),
            onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetallePersonaPage(objPersona: listaPersonas[index]),
                ));
            },    
         ); 
        },
      ),
    );
  }
}
