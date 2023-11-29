

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/home_layout/search_tap.dart';
import 'package:news_app/shared/network/local/my_provider/my_provider.dart';
import 'package:provider/provider.dart';

import '../models/gategory_model_en.dart';

import '../screens/category/categories_tap.dart';
import '../screens/setting/setting_screen.dart';
import '../screens/sources/sources.dart';
import 'Drawer_tap.dart';


class HomeLayout extends StatefulWidget {
  static const String routeName = "home layout";


  @override
  State<HomeLayout> createState() => _HomeLayouutState();
}

class _HomeLayouutState extends State<HomeLayout> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);

    List<GategoryModel> caterioes =
    GategoryModel.getGategories();




    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.cover)),


        child: Scaffold(
          drawer: DrawerTap(onClickedDrawer),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              IconButton(onPressed: () {
                showSearch(context: context, delegate: NewsSearch());
              }, icon: Icon(Icons.search))
            ],
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
          body:
          Stack(
          children: [
            if(gategoryModel == null &&index!=2)
        CategoryiesTap(caterioes, onClicked),

    if (index==2)
      SettingScreen(),
    if (gategoryModel!=null&&index!=2)
    SourcesScreen(gategoryModel!.id),


    ])));
  }

  GategoryModel? gategoryModel = null;

  onClicked(gatecory) {
    gategoryModel = gatecory;
    setState(() {});
  }

  onClickedDrawer(id) {
    if (id == DrawerTap.CAT_ID) {
      index=id;
      gategoryModel = null;
    }
     if (id == DrawerTap.SET_ID) {

       index=DrawerTap.SET_ID;
       print(index);
    }
    setState(() {});
  }
}
