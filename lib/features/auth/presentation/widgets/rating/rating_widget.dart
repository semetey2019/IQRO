import 'package:flutter/material.dart';

import '../../../../../config/theme/app.colors.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget(
      {super.key,
      required this.text,
      required this.image,
      required this.text2});

  final String text;
  final String text2;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(
            height: 144,
            width: 100,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            )),
        Positioned(
          top: 5,
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 83,
          width: 55,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Image.asset(
              image,
            ),
            const SizedBox(height: 10),
            Text(
              text2,
              style: const TextStyle(
                  color: AppColors.backgroundColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
