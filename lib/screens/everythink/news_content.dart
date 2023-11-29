import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/everything_model.dart';
import 'package:news_app/shared/network/local/my_provider/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class NewsContent extends StatelessWidget {


  static const String routeName="content";
  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as Articles;

    var pro=Provider.of<MyProvider>(context);
    return
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/pattern.png"))
      ),
      
      child:
          
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar:AppBar(

            elevation: 0,
            title:Text(AppLocalizations.of(context)!.appTitle) ,

            backgroundColor: Colors.green,
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),


          body:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children:
            [
              SizedBox(
                height: MediaQuery.of(context).size.height*.02,
              ),

              Container(
                height: 200,
                  width: double.infinity,

                  child:
                  Image.network(args.urlToImage??'',fit: BoxFit.cover,)
                  ), SizedBox(
              height: 10,
            ),

               Container(
                 padding: EdgeInsets.all(8),
                 child: Text(

                 args.source?.name ?? '',
                   style: TextStyle(
                     color: Color(0xFF707070),


                   ),
                 ),
               ),

              Container(
                padding: EdgeInsets.all(8),

                child: Text(args.title??'',style: TextStyle(
                  fontWeight: FontWeight.w500
                ),),
              ),

              Container(
                padding: EdgeInsets.all(8),
                  alignment: Alignment.bottomRight,
                  child: Text(args.publishedAt?.substring(0,10)??'',)),



              Container(
                padding: EdgeInsets.all(8),

                child: Text(args.content??'',style: TextStyle(
                  fontSize: 018,
                  fontWeight: FontWeight.w300
                ),),
              )




            ],

          ),



        ),




    );
  }
}
