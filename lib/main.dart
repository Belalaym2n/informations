

import 'package:bloc/bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home_layout/home_layout.dart';
import 'package:news_app/screens/everythink/news_content.dart';
import 'package:news_app/shared/network/local/my_provider/my_provider.dart';
import 'package:provider/provider.dart';
import 'home_layout/splach_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp( ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context)..init();

    return MaterialApp(
     locale: Locale(pro.languageCode),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
    debugShowCheckedModeBanner: false,
      initialRoute:SplashScreen.routeName,
      routes: {
      HomeLayout.routeName:(context) => HomeLayout(),
        NewsContent.routeName:(context) => NewsContent(),
        SplashScreen.routeName:(context) => SplashScreen(),
      },


     );





  }
}
