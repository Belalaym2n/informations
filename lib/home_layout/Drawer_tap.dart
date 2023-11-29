import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class DrawerTap extends StatelessWidget {
Function onClicked;

DrawerTap(this.onClicked);
static int CAT_ID=1;
static int SET_ID=2;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(

        color: Colors.white,
        width: MediaQuery.of(context).size.width*.7,

        child:Column(
          children: [
            Container(
              color: Colors.green,
              height: 110,
              width: double.infinity,
              child: Center(child: Text(
           AppLocalizations.of(context)!.drawerName,
                style:
              TextStyle(
                color: Colors.white,
                fontWeight:FontWeight.w500,
                fontSize: 22
              ),)),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon((Icons.list)),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
  onClicked(CAT_ID);
  Navigator.pop(context) ;
                     },
                    child: Text(AppLocalizations.of(context)!.categories , style:
                        TextStyle(

                        fontWeight:FontWeight.w500,
                        fontSize: 18
                    ),),
                  ),

                ],
              ),
            ),   Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon((Icons.settings)), SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {

onClicked(SET_ID);
Navigator.pop(context);
                    },
                    child: Text(AppLocalizations.of(context)!.settings ,  style:
                    TextStyle(

                        fontWeight:FontWeight.w500,
                        fontSize: 18
                    ),),
                  )

                ],
              ),
            )
            ,
          ],

        ),
      ),
    );
  }
}
