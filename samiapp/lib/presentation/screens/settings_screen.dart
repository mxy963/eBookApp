
import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showSettingsDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text('This is a placeholder for $title settings.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kProgressIndicator,
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _showSettingsDialog(context, 'Language');
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _showSettingsDialog(context, 'Notifications');
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Privacy and Security'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _showSettingsDialog(context, 'Privacy and Security');
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help and Support'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _showSettingsDialog(context, 'Help and Support');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _showSettingsDialog(context, 'About');
            },
          ),
        ],
      ),
    );
  }
}
