
import 'package:flutter/material.dart';
import 'package:news_app/models/gategory_model_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'category_item.dart';

class CategoryiesTap extends StatelessWidget {
List<GategoryModel>gategoryModel;
Function onClick;
CategoryiesTap(this.gategoryModel,this.onClick);
//bool isSellected;

@override
  Widget build(BuildContext context) {
    return
     Container(

       margin: EdgeInsets.all(6),
       // padding: EdgeInsets.all(12),
        child: Padding(

          padding: EdgeInsets.all(8),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
           AppLocalizations.of(context)!.descriptionCategory,
          //       "Pick your category\n"
          //     "of interest",
                style: TextStyle(
                fontSize: 15,fontWeight: FontWeight.w600
              ),),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView(gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    crossAxisSpacing: 0,
                mainAxisSpacing: 3),
                    children: gategoryModel.map((category) =>
                        InkWell(
                            onTap: () {
                              onClick(category);

                            },

                            child
                            : CategoryItem(category))).toList()


                )  )

            ],
          ),
        ),

    );
  }
}
