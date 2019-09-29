import 'package:flutter/material.dart';
import './screens/menu.dart';
import './blocs/themeBloc.dart';
import './theme/style.dart';
import './screens/home/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'utils/app_localizations.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnable,
      initialData: false,
       builder: (context, snapshot) => MaterialApp(
          theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
              const Locale('tr', 'TR'),
              const Locale('en', 'US'),
          ],
          home: Home(snapshot.data, bloc)),
    );
  }
}

final bloc = ThemeBloc();