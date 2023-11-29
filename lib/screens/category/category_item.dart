import 'package:flutter/material.dart';
import 'package:news_app/models/gategory_model_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryItem extends StatelessWidget {
GategoryModel gategoryModel;

CategoryItem(this.gategoryModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(18) ,
            topRight: Radius.circular(18)
        )
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(gategoryModel.image)),
          SizedBox(
            height: 05,
          ),
          Text(gategoryModel.name,style: TextStyle(

          ),
           ), SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
