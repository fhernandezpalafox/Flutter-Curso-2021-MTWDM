import 'package:flutter/material.dart';

class RatinBarCustom extends StatefulWidget {

 //properties 
 int numberStart;
 double startCount;
 Color  colorStart;
 double sizeIcon;

 //constructores o inicializadores
 RatinBarCustom({
    this.numberStart = 5,
    this.startCount = 1.0,
    this.sizeIcon = 24.0,
    @required
    this.colorStart
 });


  @override
  _RatinBarCustomState createState() => _RatinBarCustomState();
}

class _RatinBarCustomState extends State<RatinBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: dynamicIcons(),
    );
  }

  List<Widget> dynamicIcons(){

     int count = 1;
     bool flagdecimal = false;

     var numStartString  = widget.startCount.toString();
     var arrNum = numStartString.split(".");

     return List<Widget>.generate(widget.numberStart, (int index)  {
        //2.3
        if(count <= int.parse(arrNum[0])) {
            count += 1;
            return typeIconStart(Icons.star);
        }else if(int.parse(arrNum[1]) != 0 && flagdecimal == false){
          count += 1;
          flagdecimal =  true;
          return typeIconStart(Icons.star_half);
        }else if(count > int.parse(arrNum[0])){
          count += 1;
          return typeIconStart(Icons.star_border);
        }

        return null;

     });


  }


  Widget typeIconStart(IconData icon){
   return  Container(
       margin:  EdgeInsets.only(right: 3.0),
       child: Icon(
         icon,
         color: widget.colorStart,
         size: widget.sizeIcon,
       ),
   );
  }

}