import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoflutter/calendar/screens/calendar.dart';
import 'package:todoflutter/calendar/screens/splash.dart';
import 'package:todoflutter/loginpage/login_page.dart';
import 'package:todoflutter/menupage.dart';
import 'HomePage.dart';
import 'Menu.dart';
import 'Onbording/Onbording.dart';
import 'calendar/screens/sputil.dart' show SpUtils ;




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs=await SharedPreferences.getInstance();
  final showHome=prefs.getBool('showHome')??false;
  //
  //
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  var box2 = await Hive.openBox('mybox2');
  var box3 = await Hive.openBox('mybox3');
  var box4 = await Hive.openBox('mybox4');
  var box5 = await Hive.openBox('mybox5');
  var box6 = await Hive.openBox('mybox6');
  var box7 = await Hive.openBox('mybox7');
  var box8 = await Hive.openBox('mybox8');

  initializeDateFormatting()
      .then((_) => {runApp(MyApp(showHome:showHome)), loadAsync()});

}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key?key,required this.showHome,}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showHome?HomePage():Onbording(),
      theme: ThemeData(primarySwatch: Colors.yellow),

      routes: <String,WidgetBuilder>{
        '/home': (context) => HomePage(),
        '/menu': (context) => menuoage(),
        '/calandar': (context) =>  Calendar(),
        '/login': (context) =>  LoginPage(),
      },

    );
  }
}

void loadAsync() async {
  await SpUtils.getInstance();
}

