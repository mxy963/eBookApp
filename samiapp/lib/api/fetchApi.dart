// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Inf.dart';

Future<List<Inf>> getInfByApi() async {
  final Uri url = Uri.parse(
    'https://www.googleapis.com/books/v1/volumes?q=subject:fiction&maxResults=40',
  );

  try {
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> items = data['items'];

      List<Inf> infList = items.map((item) {
        final volumeInfo = item['volumeInfo'];
        return Inf(
          author: volumeInfo['authors']?.join(', ') ?? 'Unknown Author',
          title: volumeInfo['title'] ?? 'Untitled',
          url: volumeInfo['infoLink'] ?? '',
          urlToImage: volumeInfo['imageLinks']?['thumbnail'] ?? '',
        );
      }).toList();

      // Update the global getInf list
      getInf = infList;

      return infList;
    } else {
      throw Exception('Failed to load books: ${response.statusCode}');
    }
  } catch (e) {
    return []; // Return an empty list instead of throwing an exception
  }
}
