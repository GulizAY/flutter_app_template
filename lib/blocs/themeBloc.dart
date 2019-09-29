import 'dart:async';

// class ThemeBloc {
//   StreamSubscription _audioPlayerStateSubscription;

//   Stream<bool> get darkThemeEnable => _themeController.stream;
//   get changeTheme => _themeController.sink.add;
//   final StreamController<bool> _themeController = StreamController<bool>();

//   ThemeBloc();

//   void dispose() {
//     _themeController.close();  
//   }
// }
class ThemeBloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnable => _themeController.stream;
}