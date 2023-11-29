import 'dart:math';

import 'package:flutter/material.dart';

class TasbixViewPainter extends CustomPainter {
  final Color color;
  final int majorTickerCount;
  final int minorTickerCount;

  TasbixViewPainter({
    required this.color,
    this.majorTickerCount = 12,
    this.minorTickerCount = 8,
  });

  late final majorScalePaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = color
    ..strokeWidth = 2.0;

  late final minorScalePaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = color.withOpacity(0.7)
    ..strokeWidth = 2.0;

  late final majorScaleStyle = const TextStyle(
      color: Colors.white24, fontSize: 15, fontWeight: FontWeight.w400);
  late final _majorTicks = _layoutScale(majorTickerCount);
  late final _minorTicks = _layoutScale(minorTickerCount);

  late final cardinalityStyle = TextStyle(
    color: color,
    fontSize: 24,
  );

  @override
  void paint(Canvas canvas, Size size) {
    const origin = Offset.zero;
    final center = size.center(origin);
    final radius = size.width / 2;

    final majorTickLenght = size.width * 0.09;
    final minorTickLenght = size.width * 0.09;

    canvas.save();

    //paint major Scale
    for (final angle in _majorTicks) {
      final tickStart =
          Offset.fromDirection(_correctAngle(angle).toRadians(), radius);
      final tickEnd = Offset.fromDirection(
          _correctAngle(angle).toRadians(), radius - majorTickLenght);
      canvas.drawLine(center + tickStart, center + tickEnd, majorScalePaint);
    }

    //paint minor Scale
    for (final angle in _minorTicks) {
      final tickStart =
          Offset.fromDirection(_correctAngle(angle).toRadians(), radius);
      final tickEnd = Offset.fromDirection(
          _correctAngle(angle).toRadians(), radius - minorTickLenght);
      canvas.drawLine(center + tickStart, center + tickEnd, minorScalePaint);
    }

    // paint angle degree
    {
      final textPadding = majorTickLenght - size.width * 0.02;
      final textPainter = TextSpan(
        style: majorScaleStyle,
      ).toPainter()
        ..layout();

      final layoutOffest = Offset.fromDirection(
        radius - textPadding,
      );

      final offset = center + layoutOffest;

      canvas.restore();
      // canvas.save();

      canvas.translate(offset.dx, offset.dy);

      canvas.translate(-offset.dx, -offset.dy);

      textPainter.paint(
          canvas, Offset(offset.dx - (textPainter.width / 2), offset.dy));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

@override
bool shouldRepaint() {
  return false;
}

List<double> _layoutScale(int ticks) {
  final scale = 360 / ticks;
  return List.generate(ticks, (index) => index * scale);
}

double _correctAngle(double angle) => angle - 90;

typedef CardinalityMap = Map<num, String>;

extension on TextSpan {
  TextPainter toPainter({TextDirection textDirection = TextDirection.ltr}) =>
      TextPainter(text: this, textDirection: textDirection);
}

extension on num {
  double toRadians() => this * pi / 180;
}
