
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/shared/network/local/my_provider/my_provider.dart';
import 'package:provider/provider.dart';

import '../../../bottom_sheet/bottom_sheet_language.dart';


class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var pr=Provider.of<MyProvider>(context);
    return


      Column(

        crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*.03,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(AppLocalizations.of(context)!.language),
        ),
        Container(


          margin: EdgeInsets.all(20),

          width: double.infinity,
          height: MediaQuery.of(context).size.height*.05,
          decoration: BoxDecoration(border: Border.all(

              color:Colors.green
          )),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child:
            Row(
    children: [
      Expanded(
        child: Container(
          child: Text(
              pr.languageCode=="ar"?
                  AppLocalizations.of(context)!.arabic:
                  AppLocalizations.of(context)!.english

              ,style: TextStyle(
            color: Colors.green,

          ),),

    ),
      ),
      InkWell(
        onTap: () {
          ButtomSheetLanguage();

        },
        child: Icon(Icons.keyboard_arrow_down_rounded,
          size: 20,color: Colors.green,),
      )

    ],
    )

          ),

        ),

      ],
    );
  }

  ButtomSheetLanguage( ){
    showModalBottomSheet(context: context, builder:
        (context) => BottomSheetLanguage(),);
  }
}
