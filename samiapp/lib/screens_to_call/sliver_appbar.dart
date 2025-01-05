import 'package:samiapp/consttants.dart';
import 'package:flutter/material.dart';

class SliverAppbar extends StatefulWidget {
  const SliverAppbar({super.key});

  @override
  State<SliverAppbar> createState() => _SliverAppbarState();
}

class _SliverAppbarState extends State<SliverAppbar> {
  double _appBarHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: kProgressIndicator,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: kProgressIndicator,
          ),
          onPressed: () {},
        ),
      ],
      expandedHeight: 220.0,
      floating: true,
      pinned: true,
      elevation: 5,
      centerTitle: true,
      title: AnimatedOpacity(
        opacity: _appBarHeight > 120 ? 0 : 1,
        duration: const Duration(milliseconds: 300),
        child: const Text(
          'Home Page',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: kProgressIndicator,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          _appBarHeight = constraints.biggest.height;
          return FlexibleSpaceBar(
            centerTitle: true,
            title: AnimatedOpacity(
              opacity: _appBarHeight < 120 ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: const Text(
                'What are you reading today?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kBlackColor,
                ),
              ),
            ),
            background: Image.asset(
              "assets/images/Bitmap.png",
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
