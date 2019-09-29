import 'package:flutter/material.dart';
import './../theme/style.dart';
import '../blocs/themeBloc.dart';
import '../utils/app_localizations.dart';

import './authentication/login.dart';
import './home/index.dart';
import './notification/index.dart';
import './participation/index.dart';
import './setting/index.dart';

class Menu extends StatefulWidget {

  final ThemeBloc bloc; 
  final bool darkThemeEnable;
  Menu(this.darkThemeEnable, this.bloc);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: <Widget>[
            Transform.scale( scale: 0.7,
              child: new ListTile(
                title: Text('Dark Mode',),
                trailing: Switch(
                  value: widget.darkThemeEnable,
                  onChanged: widget.bloc.changeTheme,
                ),
              ),
            ),
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                    Colors.deepOrange,
                    Colors.orangeAccent
                  ])
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset('image/user_avatar.png', width: 80, height: 80),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8.0), child: Text('User', style: TextStyle(color: Colors.white, fontSize:18.0)),),
                  ],
                ),
              ),
            ),
            MenuItem(Icons.home, AppLocalizations.of(context).translate('home_title'), () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Home(widget.darkThemeEnable, widget.bloc)))),
            MenuItem(Icons.notifications, AppLocalizations.of(context).translate('notification_title'), () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Notifications(widget.darkThemeEnable, widget.bloc)))),
            MenuItem(Icons.assignment_turned_in, AppLocalizations.of(context).translate('participation_title'), () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Participation(widget.darkThemeEnable, widget.bloc)))),
            MenuItem(Icons.settings, AppLocalizations.of(context).translate('setting_title'), () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Setting(widget.darkThemeEnable, widget.bloc)))),
            MenuItem(Icons.lock, 'Log Out', () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new LoginPage(widget.darkThemeEnable, widget.bloc)))),
          ],
        ),
    );
  }
}

class MenuItem extends StatelessWidget {
  IconData icon;
  String title;
  Function onTap;

  MenuItem(this.icon, this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border( bottom: BorderSide(color: Colors.grey.shade500))
        ),
        child: InkWell(
          splashColor: Colors.orangeAccent,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(title, style: TextStyle(
                        fontSize: 16.0
                        ),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}