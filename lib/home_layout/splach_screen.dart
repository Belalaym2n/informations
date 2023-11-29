

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home_layout/home_layout.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName="splash screen";

  @override

  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

  }


  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeLayout(),)
      ),);

    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home:  Scaffold(


        body: Stack(


          children: [
            Center(
              child: Image(


               // alignment:Alignment.centerLeft,
                  image:

                  AssetImage(


                      'assets/images/splash screen.png'),
                alignment: Alignment.centerLeft,
                fit: BoxFit.cover,
             width: 412,
              height: 870,
              //  alignment: Alignment.center,),
              ),
            )
          ],
        ),
      ),

    ) ;
  }
}
