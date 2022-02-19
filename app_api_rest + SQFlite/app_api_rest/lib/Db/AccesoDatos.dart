import 'package:app_api_rest/Models/lugares.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class AccesoDatos {

static Database _database;
static final AccesoDatos db =  AccesoDatos._();

AccesoDatos._();

Future<Database> get database  async {

    if(_database != null) return _database;
       _database  =  await initBD();
      return _database;
    }
  
initBD() async  {
    Directory documentsDirectory =  await  getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path,"BDLugares.db");

    return await  openDatabase(
                  path,
                  version: 1,
                  onCreate: (Database db, int version) async {
                  await  db.execute('''
                         CREATE TABLE lugares (
                           "id" TEXT,
                           "nombre" TEXT,
                           "descripcion" TEXT,
                           "direccion" TEXT,
                           "website"  TEXT,
                           "telefono" TEXT,
                           "imagen_nombre" TEXT,
                           "importancia" TEXT,
                           "latitud" TEXT,
                           "longitud" TEXT,
                           "title" TEXT,
                           "reaction" TEXT
                         );
                     ''');
                    }
                  );
    }

insertarLugar(Lugares lugar) async{

  final db =  await database;
  
  await db.transaction((txn) async {

     int id =  await txn.rawInsert(
       'INSERT INTO lugares(id,nombre,descripcion,direccion,telefono,website,imagen_nombre,importancia, latitud,longitud,title,reaction) '
            'VALUES(?,?,?,?,?,?,?,?,?,?,?,?)',
             [lugar.id,lugar.nombre,lugar.descripcion,lugar.direccion,lugar.telefono,lugar.website,lugar.imagenNombre,lugar.importancia,lugar.latitud,lugar.longitud,lugar.title,lugar.reaction]);   
       
      print('insert: $id'); 
  });

}


eliminarLugar() async{   

  final db =  await database;
  
  await db.transaction((txn) async {

     int cantidad =  await txn.rawDelete('DELETE FROM lugares');   
       
      print('insert: $cantidad'); 
  });

}


Future<List<Lugares>> consultarLugares() async {
 
 final db =  await database;

 List<Map> list  =  await db.rawQuery('SELECT id,nombre,descripcion,direccion,telefono,website,imagen_nombre,importancia,latitud,longitud,title,reaction FROM lugares');
 
 List<Lugares>  lista = [];

 for(Map m in list){
   Lugares objLugar = Lugares(
        id: m['id'],
        nombre: m['nombre'],
        descripcion:m['descripcion'],
        direccion: m['direccion'],
        telefono: m['telefono'],
        website: m['website'],
        imagenNombre: m['imagen_nombre'],
        importancia: m['importancia'],
        latitud: m['latitud'],
        longitud: m['longitud'],
        rating: m['rating'],
        title: m['title'],
        reaction : m['reaction'] );
  
  lista.add(objLugar);
 }

 if(lista.length > 0) {
   return lista;
 }

return null;

}

}