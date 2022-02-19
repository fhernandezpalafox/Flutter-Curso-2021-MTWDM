import 'package:app_api_rest/Pages/lugaresDetail.dart';
import 'package:app_api_rest/Services/lugaresService.dart';
import 'package:flutter/material.dart';
import 'package:progress_hud/progress_hud.dart';


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
          future: lugarservice.obtenerLugares(),
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
                         leading: CircleAvatar(
                           backgroundImage: NetworkImage(
                              snapshot.data[index].imagenNombre
                              )
                           ),
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