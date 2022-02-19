import 'package:app_lugares_customwidgets/librerias/RatingBarCustom.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         reviewDescription('assets/img/viajero1.jpeg', 'Alejandra',' 2 review de 5 fotos', 'Este es un ejemplo de comentario',2),
         reviewDescription('assets/img/viajero2.jpg', 'Felipe',' 3 review de 7 fotos', 'Este es un ejemplo de comentario',3),
       ],
    );
  }

  
Widget reviewDescription(String pathImage, 
                         String nombre,
                         String detalle,
                         String comentario,
                         int numeroRating){

 final comentarioUsuario =  Container(
     margin: EdgeInsets.only(
       left: 20.0
     ),
     child: Text(
       comentario,
       textAlign: TextAlign.left,
       style: TextStyle(
         fontSize: 13.0,
         fontWeight: FontWeight.w900
       ),
     ),
     ); 

   final informacionUsuario =  Container(
     margin: EdgeInsets.only(
       left: 20.0
     ),
     child: Text(
       detalle,
       textAlign: TextAlign.left,
       style: TextStyle(
         fontSize: 13.0,
         color: Color(0xFFa3a5a7)
       ),
     ),
     );  


   final nombreUsuario =  Container(
     margin: EdgeInsets.only(
       left: 20.0
     ),
     child: Text(
       nombre,
       textAlign: TextAlign.left,
       style: TextStyle(
         fontSize: 17.0
       ),
     ),
     ); 

     final detalleUsuario  = Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
           nombreUsuario,
           Row(
             children: [
               informacionUsuario,
               Padding(
                 padding: const EdgeInsets.only(left: 10.0),
                 child: RatinBarCustom(numberStart: 5, startCount: numeroRating.toDouble(), colorStart: Color(0xFF493f90), sizeIcon: 15.0,),
               )
             ],
           ),
           comentarioUsuario
       ],
     );  

     final foto =  Container(
       margin: EdgeInsets.only(
         top:20.0,
         left: 20.0
       ),
       width: 80.0,
       height: 80.0,
       decoration: BoxDecoration(
         shape: BoxShape.circle,
         image: DecorationImage(
           fit: BoxFit.cover,
           image: AssetImage(pathImage)
         )
       ),
     );


   return Row(
    children: [
      foto,
      detalleUsuario
    ],
  );                            
  
}

}