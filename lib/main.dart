import 'package:excercise2/models/providers.dart';
import 'package:excercise2/screens/dashboard.dart';
import 'package:excercise2/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  String? tokenValue;
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences? prefs = await SharedPreferences.getInstance();
  if (prefs != null) {
    tokenValue = prefs.getString('tokenValue');
  }

  if (tokenValue != null) {
    runApp(MyApp(
      isLogin: true,
    ));
  } else {
    runApp(MyApp(
      isLogin: false,
    ));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool? isLogin;

  MyApp({required this.isLogin});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmployeeProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: isLogin! ? DashBoardScreen() : LoginScreen(),
      ),
    );
  }
}
