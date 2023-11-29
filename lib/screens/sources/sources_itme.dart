import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/sources_model.dart';

class SourcesItem extends StatelessWidget {
Sources sources;
bool isSellected;

SourcesItem(this.sources,this.isSellected);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6
      ),
      decoration: BoxDecoration(
        color: isSellected?
        Colors.green:
        Colors.transparent,
        borderRadius: BorderRadius.circular(25),
       border: Border.all(
         color: Colors.green,
         width: 2
       ),



      ),
        child: Text(sources.name??"",style: TextStyle(
          color: isSellected?Colors.white:Colors.green
        ),),

      );



  }
}
