import 'package:flutter/material.dart';
import 'package:iqro/config/theme/app.colors.dart';

class NeumorphismTasbih extends StatelessWidget {
  const NeumorphismTasbih({
    super.key,
    required this.child,
    this.distance = 8,
    this.blur = 10,
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
        child: innerShadow ? ContainerGradient(child: child) : child);
  }
}

class ContainerGradient extends StatelessWidget {
  const ContainerGradient({
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
        color: AppColors.brown,
      ),
      child: child,
    );
  }
}
