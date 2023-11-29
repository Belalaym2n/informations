import 'package:flutter/material.dart';

class MyThemData  {






   static ThemeData LightThem =ThemeData(

       appBarTheme: AppBarTheme(
         color:Colors.green,


         elevation: 0,
         shape: OutlineInputBorder(


           borderSide: BorderSide(color: Colors.transparent),
           borderRadius: BorderRadius.only(
             bottomLeft: Radius.circular(20),
             bottomRight: Radius.circular(20),
           ),
         ),
       )

      );}




