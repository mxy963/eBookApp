// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types
 
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/screens/big_home_screen.dart';
import 'presentation/screens/welcome_screen.dart';
 

var isLogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var idKey = prefs.getString('idKey');
  var fetch = prefs.getBool('fetch') ?? false;
  runApp(MainApp(idKey: idKey, fetch: fetch));
}

class MainApp extends StatefulWidget {
  final String? idKey;
  final bool fetch;

  const MainApp({super.key, required this.idKey, required this.fetch});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: widget.fetch == false
          ? const WelcomeScreen()
          : BigHomeScreen(
              idKey: widget.idKey,
            ),
      routes: const {},
      // initialRoute: 'login',
    );
  }
}
