import 'dart:async';
import 'package:app_api_rest/Models/lugares.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LugaresService {
  
  Future<List<Lugares>> obtenerLugares() async {
     var response =  await http.get('https://appmtwdm2021.herokuapp.com/lugares');
     final parsed = jsonDecode(response.body).cast<Map<String,dynamic>>();
     List<Lugares> lugares  = parsed.map<Lugares>((json) => Lugares.fromJson(json)).toList();
    return lugares;
  }

}