import 'package:flutter/material.dart';
import '../blocs/themeBloc.dart';

class ThemeProvider extends InheritedWidget {
  final ThemeBloc bloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ThemeBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ThemeProvider) as ThemeProvider).bloc;
  }

  ThemeProvider({Key key, this.bloc, Widget child}) : super(child: child, key: key);
}