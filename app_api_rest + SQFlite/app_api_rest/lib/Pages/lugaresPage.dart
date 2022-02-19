import 'package:app_api_rest/Db/AccesoDatos.dart';
import 'package:app_api_rest/Pages/lugaresDetail.dart';
import 'package:app_api_rest/Services/lugaresService.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progress_hud/progress_hud.dart';
import 'package:connectivity/connectivity.dart';
import 'package:app_api_rest/Models/lugares.dart';

class LugaresPage extends StatefulWidget {
  
  final String title;
  LugaresPage({Key key, this.title}) : super(key: key);

  @override
  _LugaresPageState createState() => _LugaresPageState();
}

class _LugaresPageState extends State<LugaresPage> {
  
  LugaresService lugarservice  =  LugaresService();
  
  //TODO progress
  ProgressHUD progressHUD;
  bool cargando = true;


Future<List<Lugares>> verificarConexion() async {

 var  connectivityResult = await (Connectivity().checkConnectivity());
 if(connectivityResult == ConnectivityResult.none){
   return AccesoDatos.db.consultarLugares(); 
 }else if(connectivityResult == ConnectivityResult.wifi){
   return lugarservice.obtenerLugares();
 }else if(connectivityResult == ConnectivityResult.mobile){
   return  lugarservice.obtenerLugares();
 }

}

 @override
  void initState() {
    super.initState();

    progressHUD =  ProgressHUD(
         backgroundColor: Colors.transparent,
         color: Colors.white,
         containerColor: Colors.blue,
         borderRadius: 5.0,
         text: 'Cargando',
         loading: true,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Container(
        child: FutureBuilder(
          future: verificarConexion(),//lugarservice.obtenerLugares(),
          builder: (BuildContext context, AsyncSnapshot snapshot){

               if(!snapshot.hasData){ //data  == null
                 return  Container(
                    child: Center(
                      child: progressHUD,
                    ),
                 );
               }
               
               return ListView.builder(
                   itemCount: snapshot.data.length,
                   itemBuilder: (BuildContext context,int index){
                     return  ListTile(
                         leading:CachedNetworkImage(
                              imageUrl: snapshot.data[index].imagenNombre,
                              imageBuilder: (context, imageProvider) =>  CircleAvatar(
                                backgroundImage: imageProvider,
                              ),

                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ), 
                            //CircleAvatar( backgroundImage: NetworkImage(snapshot.data[index].imagenNombre)),
                           title: Text(snapshot.data[index].nombre),
                           subtitle: Text(snapshot.data[index].descripcion),
                           onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => LugaresDetail(snapshot.data[index]) ) );
                           },
                         );
                   },
               );



          }
        ),
      ),
    );
  }
}