import 'package:flutter/material.dart';

class SegundaPage extends StatelessWidget {
   
   final String titulo;

   SegundaPage(this.titulo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Page $titulo'),
      ),
       body: Center(
         child: RaisedButton(onPressed: (){
            Navigator.pop(context);
         }, child: Text('Regresar'),),
       ),
    );
  }
}