import 'package:flutter/material.dart';

class PrimerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Primera pagina"),),
      body: Center(
        child: Text("Contenido primera vista"),
      ),
    );
  }
}