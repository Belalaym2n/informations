import 'package:flutter/material.dart';
import 'package:news_app/models/sources_model.dart';

import 'package:news_app/screens/tap/tap_controllar.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

class SourcesScreen extends StatelessWidget {
  String catId;
List<Sources>sources=[];
  SourcesScreen(this.catId);

  @override
  Widget build(BuildContext context) {
    return

    FutureBuilder(future: ApiManager.getSources(catId), builder: (context, snapshot) {
      if (snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError){
       showDialog(context: context, builder: (context) {
         return
          Text("Something went wrong");

        },
       );}
      sources=snapshot.data?.sources??[];
           return TapControllarWedget(sources);
      }


    );}}



