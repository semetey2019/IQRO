import 'package:flutter/material.dart';
import '../../widgets/compass_view.dart';

class CompassScreen extends StatefulWidget {
  const CompassScreen({super.key});

  @override
  State<CompassScreen> createState() => _CompassScreenState();
}

class _CompassScreenState extends State<CompassScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey,
        body: CustomPaint(
          size: size,
          painter: CompassViewPainter(color: Colors.red),
        ));
  }
}
