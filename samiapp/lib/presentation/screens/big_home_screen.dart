// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_constants.dart';
import 'categories_screen.dart';
import 'my_account_screen.dart';
import 'my_fav_screen.dart';
import 'small_home_screen.dart';
import 'tech_news_screen.dart';

class BigHomeScreen extends StatefulWidget {
  final String? idKey;
  const BigHomeScreen({super.key, this.idKey});
  static const String tag = '/homeScreen';

  @override
  _BigHomeScreenState createState() => _BigHomeScreenState();
}

class _BigHomeScreenState extends State<BigHomeScreen>
    with SingleTickerProviderStateMixin {
  var currentIndex = 0;
  int selectedIndex = 0;

  late List<Widget> screens;
  List<IconData> listOfIcons = [];
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    listOfIcons = [
      Icons.home_rounded,
      Icons.category_rounded,
      Icons.newspaper_rounded,
      Icons.favorite_rounded,
    ];
    screens = [
      SmallHomeScreen(idKey: widget.idKey ?? ''),
      const CategoriesScreen(),
      const TechNewsScreen(),
      MyFavScreen(idKey: widget.idKey ?? ''),
    ];
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: selectedIndex == 0
            ? AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'Home',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.person_rounded, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MyAccountScreen(idKey: widget.idKey ?? ''),
                        ),
                      );
                    },
                  ),
                ],
              )
            : null,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kProgressIndicator, Colors.white],
            ),
          ),
          child: screens[selectedIndex],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(20),
          height: size.width * .155,
          decoration: BoxDecoration(
            color: kProgressIndicator.withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: size.width * .024),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  selectedIndex = index;
                });
                _controller.forward(from: 0);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? size.width * .32
                        : size.width * .18,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex
                          ? size.width * .12
                          : size.width * .10,
                      width: index == currentIndex
                          ? size.width * .32
                          : size.width * .18,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Colors.white.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            listOfIcons[index],
                            size: size.width * .076,
                            color: index == currentIndex
                                ? Colors.white
                                : Colors.white.withOpacity(.7),
                          ),
                          if (index == currentIndex)
                            AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return SizedBox(
                                  width: _animation.value * (size.width * .13),
                                  child: child,
                                );
                              },
                              child: Text(
                                index == 0
                                    ? 'Home'
                                    : index == 1
                                        ? 'Catego'
                                        : index == 2
                                            ? 'News'
                                            : 'Favorite',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
