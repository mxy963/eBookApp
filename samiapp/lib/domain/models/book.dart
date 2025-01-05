// ignore_for_file: must_be_immutable
 
import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../presentation/screens/biography_screen.dart';
import '../../presentation/screens/fantasy_screen.dart';
import '../../presentation/screens/literature_screen.dart';
import '../../presentation/screens/novels_screen.dart';
import '../../presentation/screens/region_screen.dart';

class Book {
  final String image;
  final String title;
  final String subtitle;
  final String word;

  const Book({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.word,
  });
}
class BookCardTwo extends StatelessWidget {
  const BookCardTwo({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.word,
    required this.show,
  });

  final String image;
  final String title;
  final String subtitle;
  final String word;
  final VoidCallback show;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: show,
      child: Container(
        width: 150,
        height: 250,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                image,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    word,
                    style: const TextStyle(
                      color: kProgressIndicator,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForeignBooks extends StatelessWidget {
  const ForeignBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kProgressIndicator,
        title: const Text('Foreign Books'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: const Center(
        child: Text(
          "Foreign Books",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
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
