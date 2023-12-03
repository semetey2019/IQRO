import 'package:flutter/material.dart';
import 'package:iqro/config/theme/app.colors.dart';

class Neumorphism extends StatelessWidget {
  const Neumorphism({
    super.key,
    required this.child,
    this.distance = 25,
    this.blur = 20,
    this.margin,
    this.padding,
    this.isReverse = false,
    this.innerShadow = false,
  });
  final Widget child;
  final double distance;
  final double blur;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool isReverse;
  final bool innerShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          shape: BoxShape.circle,
          boxShadow: isReverse
              ? [
                  BoxShadow(
                    color: AppColors.backgroundColor,
                    blurRadius: blur,
                    offset: Offset(-distance, -distance),
                  ),
                  BoxShadow(
                    color: AppColors.circle,
                    blurRadius: blur,
                    offset: Offset(distance, distance),
                  ),
                ]
              : [
                  BoxShadow(
                    color: AppColors.circle1,
                    blurRadius: blur,
                    offset: Offset(-distance, -distance),
                  ),
                  BoxShadow(
                    color: AppColors.circle2,
                    blurRadius: blur,
                    offset: Offset(distance, distance),
                  ),
                ],
        ),
        child: innerShadow ? ContainerGradient1(child: child) : child);
  }
}

class ContainerGradient1 extends StatelessWidget {
  const ContainerGradient1({
    super.key,
    required this.child,
    this.margin,
    this.padding,
  });
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.black,
      ),
      child: child,
    );
  }
}
