import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:app_lugares_customwidgets/librerias/RatingBarCustom.dart';
import 'package:app_lugares_customwidgets/librerias/ButtonCustom.dart';

class Description extends StatelessWidget {
  
  String pNombreLugar;
  int pEstrellas;
  String pDescripcionLugar;

  Description(this.pNombreLugar,this.pDescripcionLugar,this.pEstrellas);

  @override
  Widget build(BuildContext context) {
    
    final descripcion = Container(
         margin: EdgeInsets.only(
           top:20.0,
           left:20.0,
           right: 20.0
         ),

         child: Text(
           pDescripcionLugar,
           style: TextStyle(
             fontSize: 16.0,
             fontWeight: FontWeight.bold,
             color: Color(0xFF56575A)
           ),
         ),
    );


    final titulo = Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 340.0,
            left: 20.0,
            right: 20.0
          ),
          child: Row(
            children: [
              Text(
                pNombreLugar,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: RatinBarCustom(numberStart: 5, startCount: 4.7, colorStart: Color(0xFF493f90)),
              )
            ],
          ),
        ),
        
      ],
    );
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titulo,
        descripcion,
        ButtonCustom(textButton: "Navegar", funcOntap: (){
          eventox();
        },)
      ],
    );
  }

  void eventox(){
    print("Hola");
  }
}