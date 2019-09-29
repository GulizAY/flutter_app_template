import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../theme/style.dart';
import '../menu.dart';
import '../../blocs/themeBloc.dart';
import '../../utils/app_localizations.dart';

class Setting extends StatelessWidget {
  final bool darkThemeEnable;
  final ThemeBloc bloc; 
  Setting(this.darkThemeEnable, this.bloc);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(AppLocalizations.of(context).translate('setting_title')),
        //backgroundColor: Style.appDrawerHeaderColor,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
                Colors.deepOrange,
                Colors.orangeAccent
              ])
          ),
        ),
      ),
      drawer: Menu(darkThemeEnable, bloc),
      body: PageBody()
    );
  }
}

class PageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: Text("Setting Page"),
      );
  }
}
