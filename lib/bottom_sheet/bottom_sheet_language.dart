import 'package:flutter/material.dart';
import 'package:news_app/shared/network/local/my_provider/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomSheetLanguage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: InkWell(
                  onTap: () {
                    provider.changeLang("en");
                  },
                  child: Text(AppLocalizations.of(context)!.english))),
              provider.languageCode=="en"?

              Icon(Icons.done):
              SizedBox.shrink()
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(child: InkWell(
                  onTap: () {
                    provider.changeLang("ar");                  },
                  child: Text(AppLocalizations.of(context)!.arabic))),
              provider.languageCode=="ar"?
              Icon(Icons.done): SizedBox.shrink()
            ],
          ),
        ],
      ),
    );
  }
}
