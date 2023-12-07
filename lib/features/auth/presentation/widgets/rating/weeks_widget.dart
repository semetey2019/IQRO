import 'package:flutter/material.dart';

import '../../../../../config/theme/app.colors.dart';

class WeeksWidget extends StatelessWidget {
  const WeeksWidget({super.key, required this.text, this.blendMode});

  final String text;
  final BlendMode? blendMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text),
        SizedBox(height: 10),
        SizedBox(
          height: 15,
          width: 15,
          child: DecoratedBox(
            decoration: BoxDecoration(
              backgroundBlendMode: blendMode,
              shape: BoxShape.rectangle,
              border: Border.all(
                  strokeAlign: 18, width: 1, color: AppColors.backgroundColor),
              color: AppColors.backgroundColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
