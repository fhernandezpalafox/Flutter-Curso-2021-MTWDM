import 'dart:async';
import 'package:app_api_rest/Db/AccesoDatos.dart';
import 'package:app_api_rest/Models/lugares.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LugaresService {
  
  Future<List<Lugares>> obtenerLugares() async {
     
     AccesoDatos.db.eliminarLugar();

     var response =  await http.get('https://appmtwdm2021.herokuapp.com/lugares');
     final parsed = jsonDecode(response.body).cast<Map<String,dynamic>>();
     List<Lugares> lugares  = parsed.map<Lugares>((json) => Lugares.fromJson(json)).toList();
    
    for(var l in lugares){
      
      Lugares  lugar =  Lugares(id:l.id,
        nombre: l.nombre,
        descripcion:l.descripcion,
        direccion: l.direccion,
        telefono: l.telefono,
        website: l.website,
        imagenNombre: l.imagenNombre,
        importancia: l.importancia,
        latitud: l.latitud,
        longitud: l.longitud,
        rating: l.rating,
        title: l.title,
        reaction : l.reaction);

      AccesoDatos.db.insertarLugar(lugar);
    }
     
    return lugares;
  }

}