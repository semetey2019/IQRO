import 'package:flutter/material.dart';

import '../../../../../config/theme/app.colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.color,
    this.minimumSize,
    required this.text,
    this.onPressed,
    this.backgroundColor,
  });

  final BorderSide color;
  final Color? backgroundColor;
  final Size? minimumSize;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: theme.textTheme.titleMedium
            ?.copyWith(color: const Color.fromARGB(255, 86, 182, 220)),
      ),
      style: ElevatedButton.styleFrom(
        // shadowColor: AppColors.backgroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: const BorderSide(width: 2, color: AppColors.backgroundColor),
        elevation: 1,
        minimumSize: minimumSize,
      ),
    );
  }
}
