import 'package:samiapp/consttants.dart';
import 'package:flutter/material.dart';

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
