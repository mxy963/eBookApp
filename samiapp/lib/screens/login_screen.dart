// ignore_for_file: prefer_final_fields, constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:samiapp/screens/bigHome_screen.dart';
import 'package:samiapp/consttants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/wall.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                "Login now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kBlackColor,
                  fontSize: 30,
                ),
              ),
              Image.asset(
                "assets/images/login.png",
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 50),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: 350,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      _email = value;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: kProgressIndicator,
                      ),
                      hintText: "Your Email",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: 350,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      _password = value;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: kProgressIndicator,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: kProgressIndicator,
                      ),
                      hintText: "Password",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Material(
                color: kProgressIndicator,
                borderRadius: BorderRadius.circular(35),
                child: InkWell(
                  hoverColor: kLightBlackColor,
                  onTap: _submit,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 230,
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 15),
                          blurRadius: 20,
                          color: const Color(0xFF666666).withOpacity(.11),
                        )
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      // Implement your own authentication logic here
      bool isAuthenticated = await _authenticate(_email, _password);

      if (isAuthenticated) {
        // Store login state in SharedPreferences
        prefs.setBool('isLoggedIn', true);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const BigHomeScreen()),
          ),
        );
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      String errorMessage = 'Authentication Failed';
      AwesomeDialog(
        context: context,
        title: "Error",
        body: Text(errorMessage, style: const TextStyle(fontSize: 15)),
      ).show();
    }
  }

  Future<bool> _authenticate(String email, String password) async {
    // Implement your authentication logic here
    // This is a placeholder implementation
    await Future.delayed(const Duration(seconds: 2)); // Simulating network request
    return email == 'test@example.com' && password == 'password';
  }
}

enum AuthMode {
  SignUp,
  Login,
}
