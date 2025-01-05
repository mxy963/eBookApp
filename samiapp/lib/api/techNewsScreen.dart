// ignore: file_names

// ignore_for_file: file_names, duplicate_ignore

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:samiapp/api/Inf.dart';
import 'package:samiapp/api/fetchApi.dart';
import 'package:samiapp/consttants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

class NewsCard extends StatefulWidget {
  final Inf news;

  const NewsCard({super.key, required this.news});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      height: isExpanded ? 210 : 160,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildImage(),
              const SizedBox(width: 10),
              Expanded(child: _buildContent()),
            ],
          ),
          if (isExpanded) _buildExpandedContent(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return widget.news.urlToImage.isNotEmpty
        ? CachedNetworkImage(
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            imageUrl: widget.news.urlToImage,
            placeholder: (context, url) => _buildImagePlaceholder(),
            errorWidget: (context, url, error) => _buildImagePlaceholder(),
          )
        : Image.asset(
            'assets/images/signup.png',
            height: 100,
            width: 100,
          );
  }

  Widget _buildImagePlaceholder() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('assets/images/signup.png', height: 100, width: 100),
        const CircularProgressIndicator(color: Colors.blue),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.news.author.isNotEmpty ? widget.news.author : 'Company',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
          width: 210,
          child: Divider(color: Colors.black, thickness: 1.2),
        ),
        const SizedBox(height: 10),
        Text(
          isExpanded
              ? widget.news.title
              : '${widget.news.title.substring(0, min(40, widget.news.title.length))}...',
          style: const TextStyle(fontSize: 15, color: Colors.black),
        ),
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Text(isExpanded ? '-less' : '+more'),
        ),
      ],
    );
  }

  Widget _buildExpandedContent() {
    return Column(
      children: [
        const SizedBox(
          height: 5,
          width: 280,
          child: Divider(color: Colors.black, thickness: 1.3),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Text('For more information '),
            GestureDetector(
              onTap: () => _launchUrl(widget.news.url),
              child: const Text(
                'Click here',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
