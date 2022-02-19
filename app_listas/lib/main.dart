import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home:ListPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    )
  );
}

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  //Crear los items de la lista
  List<String> items =  List<String>.generate(30, (i) => "Item ${(i + 1)}");

  @override
  _ListPageState createState() => _ListPageState(elementos: items);
}

class _ListPageState extends State<ListPage> {

//Lista de tipo String
final List<String> elementos;

//Constructor
_ListPageState({this.elementos});

//Las claves globales
final GlobalKey<ScaffoldState> _scaffoldKey 
               = GlobalKey<ScaffoldState>();
final GlobalKey<RefreshIndicatorState> _refreshIndicatorkey
       = GlobalKey<RefreshIndicatorState>();

Future<Null> _handleRefresh(){
    final Completer<Null> completer = Completer<Null>();
    Timer(const Duration(seconds: 2),() {
       completer.complete(null);
    });

    return completer.future.then((_) {
        _scaffoldKey.currentState?.showSnackBar(
            SnackBar(content:  const Text("Refresh complete"),
                     action: SnackBarAction(
                        label: "Mostrar",
                         textColor: Colors.white,
                         onPressed: (){
                           _refreshIndicatorkey.currentState.show();
                         },
                     ),)
        );
    });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: RefreshIndicator(
        color: Colors.orange,
        key: _refreshIndicatorkey,
        onRefresh: _handleRefresh,
        child:  ListView.builder(
            itemCount: elementos.length,
            itemBuilder: (context,index){

             final  item = elementos[index];

             return Dismissible(
                key: Key(item), 
                onDismissed: (direction){
                    setState(() {
                      //Logica si fuera una API 
                      elementos.removeAt(index);
                    });

                    if(direction == DismissDirection.endToStart){
                       
                        Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("$item eliminado"))
                        );

                    }else if(direction == DismissDirection.startToEnd){
                        
                         Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("$item archivado"))
                        );
                    }

                },
                background: Container(
                  color: Colors.red,
                  child: const ListTile(
                    leading: const Icon(Icons.delete, color: Colors.white),
                  ),
                ),
                secondaryBackground: Container(
                  color: Colors.green,
                  child: const ListTile(
                    trailing: const Icon(Icons.archive, color: Colors.white),
                  ),
                ),
                //Contenido de cada item de la lista
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  title: Text("$item"),
                  subtitle: Text("Esto es una descripcion de $item"),
                  onTap: (){
                    showDialog(
                       context: context,
                       builder: (BuildContext context){
                         return AlertDialog(
                             title: Text("Este es un titulo de alerta"),
                             content: Text("Contenido del mensaje"),
                             actions: [
                               FlatButton(
                                 onPressed: (){
                                   Navigator.of(context).pop();
                                 }, 
                                 child: Text("Cerrar")
                                )
                             ],
                         );
                       }
                    );  
                  },
                )
             );
            },
        ),
      ),
    );
  }
}


