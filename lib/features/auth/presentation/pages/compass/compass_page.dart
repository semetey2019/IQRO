// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iqro/config/theme/app.colors.dart';
import 'package:iqro/features/auth/presentation/pages/compass/neumorphism.dart';
import '../../widgets/compass/compass_view.dart';
import 'package:flutter_compass/flutter_compass.dart';

class CompassScreen extends StatefulWidget {
  const CompassScreen({super.key});

  @override
  State<CompassScreen> createState() => _CompassScreenState();
}

class _CompassScreenState extends State<CompassScreen> {
  double? direction;

  double headingToDegree(double heading) {
    return heading < 0 ? 360 - heading.abs() : heading;
  }

  bool isSwitched = false;
  bool light = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          "Компас",
          style: theme.textTheme.titleLarge?.copyWith(color: AppColors.white),
        ),
      ),
      body: StreamBuilder<CompassEvent>(
        stream: FlutterCompass.events,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          direction = snapshot.data!.heading;

          if (direction == null) {
            return const Text("Device does not sensors");
          }
          return Stack(
            alignment: Alignment.center,
            children: [
              Neumorphism(
                margin: EdgeInsets.all(size.width * 0.09),
                padding: const EdgeInsets.all(10),
                child: Transform.rotate(
                  angle: (direction! * (pi / 180) * -1),
                  child: CustomPaint(
                    size: size,
                    painter: CompassViewPainter(color: Colors.white),
                  ),
                ),
              ),
              CenterDisplayMeter(
                direction: headingToDegree(direction!),
              ),
              //кызыл стрелка
              Positioned.fill(
                top: size.height * .21,
                child: Column(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: AppColors.red,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey,
                              blurRadius: 4,
                              offset: Offset(8, 8)),
                        ],
                      ),
                    ),
                    Container(
                      width: 5,
                      height: size.width * .22,
                      decoration: const BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey,
                              blurRadius: 4,
                              offset: Offset(8, 8)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class CenterDisplayMeter extends StatelessWidget {
  const CenterDisplayMeter({Key? key, required this.direction})
      : super(key: key);

  final double direction;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Neumorphism(
      margin: EdgeInsets.all(size.width * 0.27),
      distance: 2.5,
      blur: 5,
      child: Neumorphism(
        margin: EdgeInsets.all(size.width * 0.05),
        distance: 0,
        blur: 0,
        innerShadow: true,
        isReverse: true,
        child: Neumorphism(
          margin: EdgeInsets.all(size.width * 0.02),
          distance: 4,
          blur: 4,
          child: ContainerGradient1(
            padding: EdgeInsets.all(size.width * 0.01),
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${direction.toInt().toString().padLeft(3, '0')}°",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    getDirection(direction),
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getDirection(double direction) {
    if (direction >= 337.5 || direction < 22.5) {
      return 'N';
    } else if (direction >= 22.5 && direction < 67.5) {
      return 'NE';
    } else if (direction >= 22.5 && direction < 67.5) {
      return 'NE';
    } else if (direction >= 67.5 && direction < 112.5) {
      return 'E';
    } else if (direction >= 112.5 && direction < 157.5) {
      return 'SE';
    } else if (direction >= 157.5 && direction < 202.5) {
      return 'S';
    } else if (direction >= 202.5 && direction < 247.5) {
      return 'SW';
    } else if (direction >= 247.5 && direction < 292.5) {
      return 'W';
    } else if (direction >= 292.5 && direction < 337.5) {
      return 'NW';
    } else {
      return 'N';
    }
  }
}
