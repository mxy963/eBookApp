
import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../data/repositories/book_repository.dart';
import '../screens/details_screen.dart';

class BookCard extends StatelessWidget {
  final int id;
  final dynamic idKey;

  const BookCard({
    super.key,
    required this.id,
    required this.idKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      height: 140,
      width: 140,
      child: Stack(
        children: <Widget>[
          Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 10,
                  color: kShadowColor.withOpacity(.50),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(book[id]['image'] as String),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              padding: const EdgeInsets.only(left: 8),
              alignment: AlignmentDirectional.topStart,
              height: 85,
              width: 202,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    book[id]['title'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    book[id]['subtitle'] as String,
                    style: const TextStyle(
                      fontSize: 8,
                      color: kLightBlackColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            idKey: idKey,
                            id: id,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 75,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Details",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: kBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
