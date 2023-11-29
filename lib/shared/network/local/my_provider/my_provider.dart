import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier{

  String languageCode="en";
  late final SharedPreferences prefs;
  void init()async{
   prefs = await SharedPreferences.getInstance();
    languageCode=  prefs.getString("language")??'en';
  }


  void changeLang(String langCode)async{
    languageCode=langCode;
    await prefs.setString('language', languageCode);

    notifyListeners();

  }

}