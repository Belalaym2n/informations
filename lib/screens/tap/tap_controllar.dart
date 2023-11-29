import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/sources_model.dart';
import 'package:news_app/screens/everythink/everything_item.dart';
import 'package:news_app/screens/everythink/news_content.dart';
import 'package:news_app/screens/sources/sources_itme.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';


class TapControllarWedget extends StatefulWidget {

List<Sources>sources;


TapControllarWedget(this.sources,);

  @override
  State<TapControllarWedget> createState() => _TapControllarWedgetState();
}

class _TapControllarWedgetState extends State<TapControllarWedget> {
int index=0;

  @override
  Widget build(BuildContext context) {


    return
   Column(


         children: [


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultTabController(

                      length: widget.sources.length,
                      child:
                      TabBar(
                          isScrollable: true,
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          onTap: (value) {
                            index = value;
                            setState(() {});
                          },
                          tabs: widget.sources
                              .map((sources) => SourcesItem(
                              sources, widget.sources.indexOf(sources) == index))
                              .toList()),
                    ),
                  ),

                  FutureBuilder(future: ApiManager.
                  getNews(sourceId:widget.sources[index].id,
                      ),

                      builder: (context, snapshot) {
                    if (snapshot.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError){
                      showDialog(context: context, builder: (context) {
                        return
                          Text("Something went wrong");

                      },
                      );}
                   var newsList=snapshot.data?.articles??[];
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {

                      return

                        EverythindItem(newsList[index],onClickContent:onClickContent ,);

                    },itemCount: newsList.length,),
                  );})



        ],
      );}
EverythindItem? everythindItem =null;

onClickContent(){

}
}






