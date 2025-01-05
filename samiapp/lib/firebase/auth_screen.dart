// ignore_for_file: constant_identifier_names, use_build_context_synchronously

import 'package:samiapp/button.dart';
import 'package:samiapp/consttants.dart';
import 'package:samiapp/screens/bigHome_screen.dart';
import 'package:flutter/material.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

enum AuthMode {
  SignUp,
  Login,
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthMode authMode = AuthMode.SignUp;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
    'userName': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          authMode == AuthMode.SignUp ? "Sign Up  " : 'Log In',
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: kProgressIndicator,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (authMode == AuthMode.SignUp)
                      TextFormField(
                        onSaved: (val) {
                          _authData['userName'] = val as String;
                        },
                        validator: (val) {
                          if (val!.length > 100) {
                            return "username cant to be larger than 100 letter";
                          }
                          if (val.length < 2) {
                            return "username cant to be less than 2 letter";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          hintText: 'Enter Your username ',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 10,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 10),
                    TextFormField(
                      onSaved: (val) {
                        _authData['email'] = val as String;
                      },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "email cant to be larger than 100 letter";
                        }
                        if (val.length < 2) {
                          return "email cant to be less than 2 letter";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter Your Email ',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      onSaved: (val) {
                        _authData['password'] = val as String;
                      },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "password cant to be larger than 100 letter";
                        }
                        if (val.length < 4) {
                          return "password cant to be less than 4 letter";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter Your Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(authMode == AuthMode.SignUp
                              ? "if you have account "
                              : 'Create new account'),
                          InkWell(
                            onTap: () {
                              setState(() {
                                authMode == AuthMode.Login
                                    ? authMode = AuthMode.SignUp
                                    : authMode = AuthMode.Login;
                              });
                            },
                            child: const Text(
                              "click Here",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyButton(
                      color: kProgressIndicator,
                      title:
                          authMode == AuthMode.SignUp ? "Sign Up " : 'Log In',
                      onPressed: _submit,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      return;
    } else {
      FocusScope.of(context).unfocus();
      _formKey.currentState!.save();
    }

    SharedPreferences s1 = await SharedPreferences.getInstance();
    try {
      
      String userId = DateTime.now().millisecondsSinceEpoch.toString();
      s1.setString('idKey', userId);
      s1.setBool('fetch', true);
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => BigHomeScreen(
                idKey: userId,
              )),
        ),
      );
    } catch (error) {
      var errorMessage = 'Authentication Failed';
      AwesomeDialog(
              context: context,
              title: "Error",
              body: Text(errorMessage, style: const TextStyle(fontSize: 15)))
          .show();
    }
  }
}
