import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iqro/features/auth/presentation/pages/rating/trophy_page.dart';
import '../../../../../config/theme/app.colors.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          "Жетишкендик",
          style: theme.textTheme.titleMedium?.copyWith(color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(26, 90, 27, 20),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/rating/magic.png",
                color: AppColors.backgroundColor,
              ),
            ),
            const SizedBox(height: 113),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RatingWidget(
                  text: "Очколор",
                  image: 'assets/rating/power.png',
                  text2: '44',
                ),
                RatingWidget(
                  text: 'Убакыт',
                  image: 'assets/rating/alarm.png',
                  text2: '3:30',
                ),
                RatingWidget(
                  text: 'Сапат',
                  image: 'assets/rating/bx.png',
                  text2: '50%',
                ),
              ],
            ),
            SizedBox(height: 60),
            ButtonWidget(
              backgroundColor: AppColors.white,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => TrophyPage()));
              },
              color: BorderSide(width: 2, color: AppColors.backgroundColor),
              minimumSize: const Size(double.infinity, 56),
              text: "Кийинки",
            )
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.color,
    this.minimumSize,
    required this.text,
    this.onPressed,
    this.backgroundColor,
  });

  final BorderSide color;
  final Color? backgroundColor;
  final Size? minimumSize;
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: theme.textTheme.titleMedium?.copyWith(color: AppColors.circle1),
      ),
      style: ElevatedButton.styleFrom(
        shadowColor: AppColors.backgroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: BorderSide(width: 2, color: AppColors.backgroundColor),
        elevation: 1,
        minimumSize: minimumSize,
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  const RatingWidget(
      {super.key,
      required this.text,
      required this.image,
      required this.text2});

  final String text;
  final String text2;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(
            height: 144,
            width: 100,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            )),
        Positioned(
          top: 5,
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 83,
          width: 55,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Image.asset(
              image,
            ),
            const SizedBox(height: 10),
            Text(
              text2,
              style: const TextStyle(
                  color: AppColors.backgroundColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
