import 'package:samiapp/consttants.dart';
import 'package:flutter/material.dart';

import '../foreign_books.dart';
import '../grafik/grafik.dart';
import '../hava.dart';
import '../internal_books.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kProgressIndicator,
          title: const Text('Categories'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView(
            children: <Widget>[
              _buildCategoryTile(
                context,
                "Foreign Books",
                const ForeignBooks(),
                Icons.book,
              ),
              _buildCategoryTile(
                context,
                "Internal Books",
                const InternalBooks(),
                Icons.library_books,
              ),
              _buildCategoryTile(
                context,
                "Statistics",
                const Grafik(),
                Icons.bar_chart,
              ),
              _buildCategoryTile(
                context,
                "Weather",
                const Hava(),
                Icons.cloud,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTile(
      BuildContext context, String title, Widget destination, IconData icon) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          },
          child: ListTile(
            leading: Icon(icon, color: kProgressIndicator),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
        const Divider(
          color: kProgressIndicator,
        ),
      ],
    );
  }
}
