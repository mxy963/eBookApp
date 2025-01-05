import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  final String idKey;
  const MyInfo({super.key, required this.idKey});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: John Doe'),
            SizedBox(height: 8),
            Text('Email: johndoe@example.com'),
            // Add more fields as needed
          ],
        ),
      ),
    );
  }
}
