// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types

import 'package:samiapp/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/bigHome_screen.dart';

var isLogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var idKey = prefs.getString('idKey');
  var fetch = prefs.getBool('fetch') ?? false;
  runApp(samiapp(idKey: idKey, fetch: fetch));
}

class samiapp extends StatefulWidget {
  final String? idKey;
  final bool fetch;

  const samiapp({super.key, required this.idKey, required this.fetch});

  @override
  State<samiapp> createState() => _samiappState();
}

class _samiappState extends State<samiapp> {
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
