import 'package:app_lugares_customwidgets/widgets%20utilerias/description.dart';
import 'package:app_lugares_customwidgets/widgets%20utilerias/headerAppBar.dart';
import 'package:app_lugares_customwidgets/widgets%20utilerias/review.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            Description("Lugar 1 ", "Esta es una descripcion largar para un parrafo,Esta es una descripcion largar para un parrafo Esta es una descripcion largar para un parrafo ", 3),
            Review()            
          ],
        ), 
        HeaderAppBar()
      ],
    );
  }
}