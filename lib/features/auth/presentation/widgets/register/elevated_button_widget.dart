import 'package:flutter/material.dart';
import 'package:iqro/config/theme/app.colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget(
      {super.key, required this.text, this.onPressed, this.style});

  final Function()? onPressed;
  final TextStyle? style;
  final String text;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text,
          style: theme.textTheme.titleSmall?.copyWith(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 1,
        backgroundColor: AppColors.black,
        minimumSize: const Size(double.infinity, 55),
      ),
    );
  }
}
