import 'package:app_api_rest/shared/responsive.dart';
import 'package:flutter/material.dart';
import 'package:app_api_rest/Models/lugares.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class LugaresDetail extends StatelessWidget {

 final Lugares lugar;
 LugaresDetail(this.lugar);

//TODO: Gestiona el mapa
 GoogleMapController mapController;

//TODO: Crear marcadores
 Map<MarkerId,Marker> markers = <MarkerId,Marker>{};

  @override
  Widget build(BuildContext context) {

  var isPortrait =  MediaQuery.of(context).orientation == Orientation.portrait;

   double  sizeFont = 0;
   if(isTab(context) || isDesktop(context)){
     sizeFont = 20.0;
   }else if(isMobile(context)){
      sizeFont = 14.0;
   }

   


   //TODO: Se crea los marcadores 
   
   var marker = Marker(
     markerId: MarkerId("1"),
     position: LatLng(double.parse(lugar.latitud.toString()) , double.parse(lugar.longitud.toString())),
     infoWindow: InfoWindow(title: lugar.nombre, snippet: lugar.descripcion),
     onTap: (){
       print(lugar.nombre);
     }
   );

   markers[MarkerId("1")] =  marker; 

    return Scaffold(
      body: Stack(
        children: [
          ListView(
          physics: (isPortrait==true)?NeverScrollableScrollPhysics(): AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
           children: [
              (isPortrait==true)?Image.network(lugar.imagenNombre, fit: BoxFit.cover, height: 300,):Container(),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                      botonFuncion(Colors.black,Icons.call,'Llamar',1, sizefont: sizeFont),
                      botonFuncion(Colors.black,Icons.near_me,'Mapa',2, sizefont: sizeFont),
                      botonFuncion(Colors.black,Icons.find_in_page,'Web',3, sizefont: sizeFont),
                   ],
                ),
               ),
               Column(
                 children: [
                   Container(
                     height: MediaQuery.of(context).size.height / 2,
                     width: MediaQuery.of(context).size.width,
                     child: GoogleMap(initialCameraPosition: 
                            CameraPosition(target: LatLng(double.parse(lugar.latitud.toString()), double.parse(lugar.longitud.toString())),
                              zoom: 17.0
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              mapController =  controller;
                            },
                            markers: Set<Marker>.of(markers.values),
                            ),
                   )
                 ],
               ) 
           ],
          ),
           Padding(
              padding: const EdgeInsets.only(left:30.0, top:50.0),
              child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios, 
                      color: Colors.black,size: 35.0),   
                    ),
                  ),
            ),
          
        ],
      ),
    );
  }


 Widget botonFuncion(Color color, IconData icon, String label, int event, {double sizefont=12}){
   return InkWell(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         mainAxisSize: MainAxisSize.min,
         children: [
           Icon(icon, color:color),
           Container(
             margin: const EdgeInsets.only(top:8),
             child:  Text(label, style: TextStyle(
               fontSize: sizefont,
               fontWeight: FontWeight.w400,
               color:color
             ),),
           )
         ],
      ),

      onTap: (){
          if(event == 1){
            _marcar(lugar.telefono);
          }else if(event == 3){
             _irPaginaWeb(lugar.website);  
          }else if(event == 2){
            _irMapaEstatica('https://maps.googleapis.com/maps/api/staticmap?center=${lugar.latitud},${lugar.longitud}&zoom=15&size=400x400&key=AIzaSyARDffAihIXo7tYhNShT5G4NRJQV99wqnw');
          }
      },
   );
 }

 _marcar(String telefono) async {
   var url = 'tel:$telefono';
   if(await canLaunch(url)){
     await launch(url);
   }else {
     throw 'No se puede ejecutar $url';
   }
 }

 _irPaginaWeb(String url) async {
   if(await canLaunch(url)){
      await launch(url);
   }else {
     throw 'No se puede ejecutar $url';
   }
 }


  _irMapaEstatica(String url) async {
   if(await canLaunch(url)){
      await launch(url);
   }else {
     throw 'No se puede ejecutar $url';
   }
 }

}