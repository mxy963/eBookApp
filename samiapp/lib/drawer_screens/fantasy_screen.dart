import 'package:samiapp/consttants.dart';
import 'package:flutter/material.dart';

class FantasyScreen extends StatelessWidget {
  const FantasyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kProgressIndicator,
        title: const Text('Fantasy'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: const Center(
        child: Text(
          "Fantasy",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
