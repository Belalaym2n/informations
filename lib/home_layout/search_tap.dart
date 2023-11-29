import 'package:flutter/material.dart';
import 'package:news_app/screens/everythink/everything_item.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';




class NewsSearch extends SearchDelegate {






  @override
  ThemeData appBarTheme(BuildContext context) {
    return

        ThemeData(


          // dialogBackgroundColor: Colors.white,
          //backgroundColor: Colors.white,
            appBarTheme:   AppBarTheme(
              centerTitle:false,
            //  toolbarHeight: 140,

              elevation: 0,
         //     shadowColor: Colors.white,
           //   foregroundColor: Colors.white,

              shape:

              OutlineInputBorder(
                gapPadding: double.infinity,
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),),

              color: Color(0xFF39A552),

            ));


  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => showResults(context),
          icon: const Icon(
            Icons.search_outlined,
            size: 30,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder
      (future:
    ApiManager.getNews(searchKeyWord: query, ),
      builder:(context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return
           const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError|| snapshot.data=="error") {
          return Center(
            child: Text(snapshot.data?.message ?? snapshot.error.toString()),
          );
        }
        var newsList = snapshot.data?.articles?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return EverythindItem(newsList[index]);
          },
          itemCount:newsList.length
        );
      });


    }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNews(
            searchKeyWord:query
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return EverythindItem(newsList[index]);
            },
            itemCount: newsList.length,
          );
        });
  }







  }



