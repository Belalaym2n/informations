



import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class GategoryModel  {
  String name;
  String id;
  String image;

  Color color;
  GategoryModel (this.name, this.id, this.image, this.color);


    static List<GategoryModel > getGategories() {
      return [
        GategoryModel ("Sports", 'sports', 'assets/images/sports.png',Colors.white),
        GategoryModel ("Health", 'health',  'assets/images/health.png' , Colors.orange),
        GategoryModel ("Business", 'business', 'assets/images/business.png', Colors.black54),
        GategoryModel ("Technology", 'technology', 'assets/images/science.png', Colors.white),
        GategoryModel ("General", "general",  'assets/images/politics.png',Colors .blue),
        GategoryModel ("Entertainment", "entertainment", 'assets/images/enviroment.png', Colors.red),
      ];
    }
  }



//
//
//

