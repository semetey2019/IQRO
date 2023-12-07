import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iqro/features/auth/presentation/pages/rating/trophy_page.dart';
import '../../../../../config/theme/app.colors.dart';
import '../../widgets/rating/button_widget.dart';
import '../../widgets/rating/rating_widget.dart';

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
            const SizedBox(height: 60),
            ButtonWidget(
              backgroundColor: AppColors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const TrophyPage()));
              },
              color:
                  const BorderSide(width: 2, color: AppColors.backgroundColor),
              minimumSize: const Size(double.infinity, 56),
              text: "Кийинки",
            ),
          ],
        ),
      ),
    );
  }
}
