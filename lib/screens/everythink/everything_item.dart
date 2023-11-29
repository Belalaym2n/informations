import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/everything_model.dart';

import 'news_content.dart';

class EverythindItem extends StatelessWidget {
  Articles articles;
  Function? onClickContent;


  EverythindItem(this.articles, {this.onClickContent});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
Navigator.pushNamed(context, NewsContent.routeName,
arguments: articles);


      },
      child: Card(
        margin: EdgeInsets.all(12),
        elevation: 012,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.transparent,
            )),
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius:BorderRadius.only(
                       topRight: Radius.circular(18),
                      topLeft: Radius.circular(18)
                    ),
                    child:
                    CachedNetworkImage(
                      imageUrl: articles.urlToImage ?? "",    fit: BoxFit.fill,
                      height: 232.5,
                      width: 360,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),



                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      articles.source?.name ?? "",
                      style: TextStyle(
                        color: Color(0xFF707070),


                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(articles.title ?? "",style: TextStyle(
                    fontWeight: FontWeight.w400,fontSize: 18
                  ),),
                  Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        articles.publishedAt?.substring(0, 10) ?? "",
                        style: TextStyle(),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
