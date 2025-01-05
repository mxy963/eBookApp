import 'package:flutter/material.dart';

import 'consttants.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kProgressIndicator,
          title: const Text('See More'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: ListView(
          children: [
            _buildListTile(context, 'About Us', 'Learn more about our company'),
            _buildListTile(context, 'Contact', 'Get in touch with us'),
            _buildListTile(context, 'FAQ', 'Frequently asked questions'),
            _buildListTile(context, 'Terms of Service', 'Read our terms of service'),
            _buildListTile(context, 'Privacy Policy', 'View our privacy policy'),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Navigate to the respective page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(title: title),
          ),
        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kProgressIndicator,
        title: Text(title),
      ),
      body: Center(
        child: Text('This is the $title page'),
      ),
    );
  }
}
