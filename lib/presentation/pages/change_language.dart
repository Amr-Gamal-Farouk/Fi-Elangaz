import 'package:fi_angaz/Language.dart';
import 'package:fi_angaz/data/data_sources/lang_from_shared.dart';
import 'package:fi_angaz/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../AppLocalization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {

  void makeAction(String lang) async{
    Locale _temp;
    switch (lang) {
      case 'en':
        print("e");
        _temp = Locale(l.languageCode, 'US');
        break;
      case 'ar':
        print("a");
        _temp = Locale(l.languageCode, 'EG');
        break;
      default:
        print("e1");
        _temp = Locale(l.languageCode, 'US');
    }
    MyApp.setLocale(context, _temp);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(AppLocalization.of(context)!.translate("login").toString()),

            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(6),
                color: Theme.of(context).primaryColor,
                width: 120,
                child: Text(AppLocalization.of(context)!.translate("lang").toString(),
                  textAlign: TextAlign.center,) ,
              ),
              onTap: () async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String lang =await getLanguage();
                print(lang);

                if(lang=="en"){
                  makeAction("ar");
                  prefs.setString("lang", "ar");

                }else{
                  makeAction("en");
                  prefs.setString("lang", "en");
                }




              },
            )
          ],
        ),
      ),
    );;
  }
}
