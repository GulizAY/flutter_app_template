
import 'package:flutter/material.dart';
import '../../utils/app_localizations.dart';
import '../../blocs/themeBloc.dart';

import '../home/index.dart';

class LoginPage extends StatefulWidget{
  final ThemeBloc bloc; 
  final bool darkThemeEnable;
  LoginPage(this.darkThemeEnable, this.bloc);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  bool _isHidden = true;

  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Material(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset('image/logo.png', width: 80, height: 80),
              ),
            ),
            SizedBox(height: 40.0,),
            Text(
              AppLocalizations.of(context).translate('app_title'),
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent//Theme.of(context).primaryColor
              ),
            ),
            SizedBox(height: 40.0,),
            buildTextField(AppLocalizations.of(context).translate('login.email_text')),
            SizedBox(height: 20.0,),
            buildTextField(AppLocalizations.of(context).translate('login.pwd_text')),
            SizedBox(height: 20.0,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).translate('login.forgotten_button'),
                    style: TextStyle(
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            buildButtonContainer(),
            SizedBox(height: 10.0,),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(AppLocalizations.of(context).translate('login.have_account_text')),
                    SizedBox(width: 10.0,),
                    Text(AppLocalizations.of(context).translate('login.signup_button'), style: TextStyle(color: Colors.orangeAccent,))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText){
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: hintText == AppLocalizations.of(context).translate('login.email_text') ? Icon(Icons.email) : Icon(Icons.lock),
        suffixIcon: hintText == AppLocalizations.of(context).translate('login.pwd_text')? IconButton(
          onPressed: _toggleVisibility,
          icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ) : null,
      ),
      obscureText: hintText == AppLocalizations.of(context).translate('login.pwd_text') ? _isHidden : false,
    );
  }

  Widget buildButtonContainer(){
    return Container(
      height: 56.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.0),
        gradient: LinearGradient(
          colors: [
            Color(0xFFFB415B),
            Color(0xFFEE5623)
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft
        ),
      ),
      child: FlatButton(
          child: Text(
            AppLocalizations.of(context).translate('login.login_button'),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Home(widget.darkThemeEnable, widget.bloc))),
        ),
    );
  }
}