import 'package:samiapp/consttants.dart';
import 'package:samiapp/drawer_screens/fantasy_screen.dart';
import 'package:samiapp/drawer_screens/literature_screen.dart';
import 'package:samiapp/drawer_screens/novels_screen.dart';
import 'package:samiapp/drawer_screens/region_screen.dart';
import 'package:flutter/material.dart';

import 'drawer_screens/biyography_screen.dart';

class InternalBooks extends StatefulWidget {
  const InternalBooks({super.key});

  @override
  State<InternalBooks> createState() => _InternalBooksState();
}

class _InternalBooksState extends State<InternalBooks> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kProgressIndicator,
          title: const Text('Internal Books'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NovelsScreen()),
                  );
                },
                child: const ListTile(
                  title: Text(
                    "Novels",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                        builder: (context) => const FantasyScreen()),
                  );
                },
                child: const ListTile(
                  title: Text(
                    "Fantasy",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                        builder: (context) => const RegionScreen()),
                  );
                },
                child: const ListTile(
                  title: Text(
                    "Region",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                        builder: (context) => const LiteratureScreen()),
                  );
                },
                child: const ListTile(
                  title: Text(
                    "Literature",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                        builder: (context) => const BiographyScreen()),
                  );
                },
                child: const ListTile(
                  title: Text(
                    "Biography",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Divider(
                color: kProgressIndicator,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
