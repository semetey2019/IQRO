import 'dart:math';

import 'package:flutter/material.dart';

class CompassViewPainter extends CustomPainter {
  final Color color;
  final int majorTickerCount;
  final int minorTickerCount;
  final CardinalityMap cardinalityMap;

  CompassViewPainter({
    required this.color,
    this.majorTickerCount = 18,
    this.minorTickerCount = 90,
    this.cardinalityMap = const {0: 'N', 90: 'E', 180: 'S', 270: 'W'},
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
  late final _angleDegree = _layoutAngleScale(_majorTicks);

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
    final minorTickLenght = size.width * 0.055;

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

    //paint angle degree
    for (final angle in _angleDegree) {
      final textPadding = majorTickLenght - size.width * 0.02;
      final textPainter = TextSpan(
        text: angle.toStringAsFixed(0),
        style: majorScaleStyle,
      ).toPainter()
        ..layout();

      final layoutOffest = Offset.fromDirection(
        _correctAngle(angle).toRadians(),
        radius - textPadding,
      );

      final offset = center + layoutOffest;

      canvas.restore();
      canvas.save();

      canvas.translate(offset.dx, offset.dy);
      canvas.rotate(angle.toRadians());
      canvas.translate(-offset.dx, -offset.dy);

      textPainter.paint(
          canvas, Offset(offset.dx - (textPainter.width / 2), offset.dy));
    }
    // paint cardinality text
    for (final cardinality in cardinalityMap.entries) {
      final textPadding = majorTickLenght + size.width * 0.01;
      final angle = cardinality.key.toDouble();
      final text = cardinality.value;
      final textPainter = TextSpan(
        text: text,
        style:
            cardinalityStyle.copyWith(color: text == "N" ? Colors.red : null),
      ).toPainter()
        ..layout();

      final layoutOffest = Offset.fromDirection(
        _correctAngle(angle).toRadians(),
        radius - textPadding,
      );

      final offset = center + layoutOffest;

      canvas.restore();
      canvas.save();

      canvas.translate(offset.dx, offset.dy);
      canvas.rotate(angle.toRadians());
      canvas.translate(-offset.dx, -offset.dy);

      textPainter.paint(
          canvas, Offset(offset.dx - (textPainter.width / 2), offset.dy));
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  List<double> _layoutScale(int ticks) {
    final scale = 360 / ticks;
    return List.generate(ticks, (index) => index * scale);
  }

  List<double> _layoutAngleScale(List<double> ticks) {
    List<double> angle = [];
    for (var i = 0; i < ticks.length; i++) {
      if (i == ticks.length - 1) {
        double degreeVal = (ticks[i] + 360) / 2;
        angle.add(degreeVal);
      } else {
        double degreeVal = (ticks[i] + ticks[i + 1]) / 2;
        angle.add(degreeVal);
      }
    }
    return angle;
  }

  double _correctAngle(double angle) => angle - 90;
}

typedef CardinalityMap = Map<num, String>;

extension on TextSpan {
  TextPainter toPainter({TextDirection textDirection = TextDirection.ltr}) =>
      TextPainter(text: this, textDirection: textDirection);
}

extension on num {
  double toRadians() => this * pi / 180;
}
