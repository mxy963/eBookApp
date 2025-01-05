import 'package:samiapp/consttants.dart';
import 'package:flutter/material.dart';

class LiteratureScreen extends StatelessWidget {
  const LiteratureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kProgressIndicator,
        title: const Text('Literature'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: const Center(
        child: Text(
          "Literature",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
