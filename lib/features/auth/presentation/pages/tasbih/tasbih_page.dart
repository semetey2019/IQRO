import 'package:flutter/material.dart';
import 'package:iqro/config/theme/app.colors.dart';
import 'package:iqro/features/auth/presentation/pages/compass/neumorphism.dart';
import 'package:iqro/features/auth/presentation/pages/tasbih/neumorphism_tasbih.dart';
import 'package:iqro/features/auth/presentation/widgets/tasbih/tasbih_view.dart';

class TasbixScreen extends StatefulWidget {
  const TasbixScreen({super.key});

  @override
  State<TasbixScreen> createState() => _TasbixScreenState();
}

class _TasbixScreenState extends State<TasbixScreen> {
  double? direction;
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
        title: Text("Тасбих",
            style:
                theme.textTheme.titleLarge?.copyWith(color: AppColors.white)),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          NeumorphismTasbix(
            margin: EdgeInsets.all(size.width * 0.09),
            padding: const EdgeInsets.all(10),
            child: CustomPaint(
              size: size,
              painter: TasbixViewPainter(color: AppColors.white),
            ),
          ),
          // ignore: prefer_const_constructors
          CenterCircle(
            direction: '${_counter}',
          ),
          InkWell(
            onTap: () {
              _incrementCounter();
            },
            child: Image.asset(
              "assets/compas/taspix.png",
              color: Colors.white30,
            ),
          )
        ],
      ),
    );
  }
}

class CenterCircle extends StatefulWidget {
  const CenterCircle({Key? key, required this.direction}) : super(key: key);

  final String direction;

  @override
  State<CenterCircle> createState() => _CenterCircleState();
}

class _CenterCircleState extends State<CenterCircle> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Neumorphism(
      margin: EdgeInsets.all(size.width * 0.27),
      distance: 2.5,
      blur: 2,
      child: Neumorphism(
        margin: EdgeInsets.all(size.width * 0.04),
        distance: 2,
        blur: 2,
        child: ContainerGradient2(
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
                Text("${widget.direction.toString().padLeft(5, '0')}",
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: AppColors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerGradient2 extends StatelessWidget {
  const ContainerGradient2({
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
        color: Colors.black38,
      ),
      child: child,
    );
  }
}
