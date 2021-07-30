import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

Future<String> getLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? lang=  prefs.getString("lang");
  print(lang);

  if(lang==null){
    prefs.setString("lang", "en");
    return "en";
  }
  return lang;


}

 makeAction({required String lang}) {

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
      print("e2");
      _temp = Locale(l.languageCode, 'US');
  }
  return _temp;
}
