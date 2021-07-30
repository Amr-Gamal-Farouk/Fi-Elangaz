import 'package:fi_angaz/AppLocalization.dart';
import 'package:fi_angaz/Language.dart';
import 'package:fi_angaz/presentation/pages/change_language.dart';
import 'package:fi_angaz/presentation/pages/home_page.dart';
import 'package:fi_angaz/res/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'data/data_sources/lang_from_shared.dart';
import 'data/provider/test/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

    String lang=await getLanguage();
  runApp( MyApp( lang: lang,));
}

Language l = Language('Arabic', 'ar');


class MyApp extends StatefulWidget {
  String lang;

    MyApp({Key? key,  required this.lang}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState(lang:lang);

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }

  static void setTheme(BuildContext context, ThemeData theme) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setTheme(theme);
  }


}

class _MyAppState extends State<MyApp> {
  String lang;

  ThemeData myTheme = appTheme;
  late Locale _locale ;

  _MyAppState({required this.lang});

  @override
  void didChangeDependencies() {
    _locale = makeAction(lang: lang);
    super.didChangeDependencies();
  }



  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void setTheme(ThemeData theme) {
    setState(() {
      myTheme = theme;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider.value(value: TestProvider())
      ],
      child: MaterialApp(
        title: 'Fe-Elangaz',
        theme: myTheme,
        locale: _locale,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        localizationsDelegates: [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,

        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale!.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,

        home:  const HomePage(),
      ),
    );
  }
}




