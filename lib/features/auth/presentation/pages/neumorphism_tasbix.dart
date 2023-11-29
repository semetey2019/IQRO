import 'package:flutter/material.dart';

class NeumorphismTasbix extends StatelessWidget {
  const NeumorphismTasbix({
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
          color: Color(0xff236681),
          shape: BoxShape.circle,
          boxShadow: isReverse
              ? [
                  BoxShadow(
                    color: Color(0xff236681),
                    blurRadius: blur,
                    offset: Offset(-distance, -distance),
                  ),
                  BoxShadow(
                    color: Color(0xff47515c),
                    blurRadius: blur,
                    offset: Offset(distance, distance),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Color.fromARGB(255, 42, 60, 67),
                    blurRadius: blur,
                    offset: Offset(-distance, -distance),
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 35, 51, 59),
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
        color: Color.fromARGB(96, 158, 68, 68),
      ),
      child: child,
    );
  }
}
