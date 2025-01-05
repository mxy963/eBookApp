// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:samiapp/consttants.dart';
import 'package:samiapp/drawer_screens/aboutApp_screen.dart';
import 'package:samiapp/drawer_screens/settings_screen.dart';

class DrawerScreen extends StatefulWidget {
  final String idKey;
  const DrawerScreen({super.key, required this.idKey});
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String userName = 'Sami Mulla Hamid';
  String email = 'sami.mulla@gmail.com';
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    // Here you would fetch user data from a local source or API
    // For now, we'll use placeholder data
    loadUserData();
  }

  void loadUserData() {
    // Simulating data fetch
    setState(() {
      userName = 'Sami Mulla Hamid';
      email = 'sami.mulla@gmail.com';
      imageUrl = ''; // Leave empty for now
    });
  }

  Future<void> _signOut(BuildContext context) async {
    SharedPreferences s1 = await SharedPreferences.getInstance();
    await s1.setBool('fetch', false);
    await s1.setString('key', '');
    // Navigate to login screen or perform sign out logic here
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 600,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: kProgressIndicator,
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imageUrl != ''
                    ? CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.network(
                            imageUrl,
                            height: 110,
                            width: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.red[200],
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              radius: 55,
                              child: Icon(
                                FontAwesomeIcons.user,
                                size: 50,
                                color: Colors.red[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  userName,
                  style: GoogleFonts.breeSerif(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  email,
                  style: GoogleFonts.breeSerif(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutAppScreen(),
                ),
              );
            },
            child: const ListTile(
              title: Text(
                'About Us  ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.help,
                color: Colors.blue,
              ),
            ),
          ),
          const Divider(
            color: kProgressIndicator,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
            child: const ListTile(
              title: Text(
                'Settings  ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
            ),
          ),
          const Divider(
            color: kProgressIndicator,
          ),
          InkWell(
            onTap: () => _signOut(context),
            child: const ListTile(
              title: Text(
                'Sign Out',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
            ),
          ),
          const Divider(
            color: kProgressIndicator,
          ),
        ],
      ),
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 65, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 45, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
