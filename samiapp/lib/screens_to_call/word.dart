import 'package:samiapp/consttants.dart';
import 'package:flutter/material.dart';

class Word extends StatelessWidget {
  const Word({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "New Arrivals",
                style: TextStyle(
                  color: kProgressIndicator,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "See More",
                  style: TextStyle(
                    color: kLightBlackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
