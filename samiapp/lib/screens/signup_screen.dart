import 'package:samiapp/screens/bigHome_screen.dart';
import 'package:samiapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:samiapp/consttants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email = '';
  String password = '';
  String userName = '';

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Create account now",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kBlackColor,
                    fontSize: 30,
                  ),
                ),
                Image.asset(
                  "assets/images/signup.png",
                  width: 250,
                  height: 250,
                ),
                const SizedBox(height: 50),
                _buildTextField(
                  icon: Icons.person,
                  hintText: "Your Name",
                  onChanged: (value) => userName = value,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  icon: Icons.email,
                  hintText: "Your Email",
                  onChanged: (value) => email = value,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  icon: Icons.lock,
                  hintText: "Password",
                  onChanged: (value) => password = value,
                  isPassword: true,
                ),
                const SizedBox(height: 50),
                _buildSignUpButton(context),
                const SizedBox(height: 20),
                _buildSignInRow(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String hintText,
    required Function(String) onChanged,
    bool isPassword = false,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        width: 350,
        height: 50,
        child: TextField(
          textAlign: TextAlign.center,
          onChanged: onChanged,
          obscureText: isPassword,
          decoration: InputDecoration(
            icon: Icon(icon, color: kProgressIndicator),
            suffixIcon: isPassword
                ? const Icon(Icons.visibility, color: kProgressIndicator)
                : null,
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Material(
      color: kProgressIndicator,
      borderRadius: BorderRadius.circular(35),
      child: InkWell(
        hoverColor: kBlackColor,
        onTap: () {
          // Here you would typically handle the sign-up process
          // For now, we'll just navigate to the BigHomeScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BigHomeScreen(),
            ),
          );
        },
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
            "Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?"),
        const SizedBox(width: 6),
        GestureDetector(
          child: const Text(
            "Sign In",
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
