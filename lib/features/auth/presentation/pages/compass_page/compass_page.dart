import 'package:flutter/material.dart';
import '../../widgets/compass_view.dart';

class CompassScreen extends StatefulWidget {
  const CompassScreen({super.key});

  @override
  State<CompassScreen> createState() => _CompassScreenState();
}

class _CompassScreenState extends State<CompassScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff008080),
      appBar: AppBar(
        backgroundColor: Color(0xff008080),
        title: const Text("Компас",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(11, 42, 11, 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/compas/luna.png",
                  height: 60,
                  width: 57,
                ),
                Image.asset(
                  "assets/compas/Line.png",
                ),
                const Column(
                  children: [
                    Text(
                      'Bishkek, KG',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      "115.5 Градусов на запад \n от севера",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ],
                ),
                Image.asset("assets/compas/Line.png"),
                Column(
                  children: [
                    Switch(
                      value: isSwitched,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        print("v : $value");
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                    Text(
                      'v: $isSwitched',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ],
                ),
              ],
            ),
            CustomPaint(
              size: size,
              painter: CompassViewPainter(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
