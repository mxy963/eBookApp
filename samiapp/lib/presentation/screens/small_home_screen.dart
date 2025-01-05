

import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../widgets/book_card.dart';
import '../widgets/see_more.dart';
import 'drawer_screen.dart';

class SmallHomeScreen extends StatefulWidget {
  final String idKey;
  const SmallHomeScreen({super.key, required this.idKey});

  @override
  State<SmallHomeScreen> createState() => _SmallHomeScreenState();
}

class _SmallHomeScreenState extends State<SmallHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: ClipPath(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: SizedBox(
            width: 220,
            height: double.infinity,
            child: DrawerScreen(
              idKey: widget.idKey,
            ),
          ),
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            const SliverAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: 600,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.new_releases, color: kProgressIndicator),
                                Text(
                                  " New Arrivals",
                                  style: TextStyle(
                                    color: kProgressIndicator,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SeeMore(),
                                  ),
                                );
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    "See More ",
                                    style: TextStyle(
                                      color: kLightBlackColor,
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios, size: 14, color: kLightBlackColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true, // Use  children total size
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              top: 10.0,
                              right: 8.0,
                            ),
                            children: [
                              BookCard(
                                id: 0,
                                idKey: widget.idKey,
                              ),
                              BookCard(
                                idKey: widget.idKey,
                                id: 1,
                              ),
                              BookCard(
                                idKey: widget.idKey,
                                id: 2,
                              ),
                              BookCard(
                                idKey: widget.idKey,
                                id: 3,
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.trending_up, color: kProgressIndicator),
                                Text(
                                  " Top Trends",
                                  style: TextStyle(
                                    color: kProgressIndicator,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SeeMore(),
                                  ),
                                );
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    "See More ",
                                    style: TextStyle(
                                      color: kLightBlackColor,
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios, size: 14, color: kLightBlackColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true, // Use  children total size
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              top: 10.0,
                              right: 5.0,
                            ),
                            children: [
                              BookCard(
                                idKey: widget.idKey,
                                id: 4,
                              ),
                              BookCard(
                                idKey: widget.idKey,
                                id: 5,
                              ),
                              BookCard(
                                idKey: widget.idKey,
                                id: 6,
                              ),
                              BookCard(
                                idKey: widget.idKey,
                                id: 7,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
