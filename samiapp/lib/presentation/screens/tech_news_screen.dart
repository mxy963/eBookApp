// ignore: file_names

// ignore_for_file: file_names, duplicate_ignore


import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../data/datasources/api_data_source.dart';
import '../../data/repositories/inf_repository.dart';
import '../widgets/news_card.dart';

class TechNewsScreen extends StatefulWidget {
  const TechNewsScreen({super.key});

  @override
  State<TechNewsScreen> createState() => _TechNewsScreenState();
}

class _TechNewsScreenState extends State<TechNewsScreen> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    getInfByApi();
  }

  Future<void> _refreshNews() async {
    setState(() {
      getInfByApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kProgressIndicator,
        title: const Text('Tech News'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getInfByApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return RefreshIndicator(
              onRefresh: _refreshNews,
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: getInf.length,
                itemBuilder: (BuildContext context, int index) {
                  return NewsCard(news: getInf[index]);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
