import 'package:flutter/material.dart';

import '../../../../../config/theme/app.colors.dart';
import 'certificate_page.dart';
import 'rating_page.dart';

class TrophyPage extends StatefulWidget {
  const TrophyPage({super.key});

  @override
  State<TrophyPage> createState() => _TrophyPageState();
}

class _TrophyPageState extends State<TrophyPage> {
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
        padding: const EdgeInsets.fromLTRB(36, 90, 37, 20),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/rating/trophy.png",
                color: AppColors.backgroundColor,
              ),
            ),
            const SizedBox(height: 73),
            SizedBox(
              height: 188,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                      strokeAlign: 20,
                      width: 1,
                      style: BorderStyle.solid,
                      color: AppColors.backgroundColor),
                  color: AppColors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "CИЗ ТЕСТТИН БААРЫНАН \nӨТТҮҢҮЗ:ЖЫЙЫНТЫКТAР",
                      style: theme.textTheme.titleMedium
                          ?.copyWith(color: AppColors.backgroundColor),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/rating/power.png"),
                        Text(
                          "Туурасы- 12",
                          style: theme.textTheme.titleMedium?.copyWith(
                              color: AppColors.grey.withOpacity(0.3)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/rating/infocircle.png"),
                        Text(
                          "Катасы -122",
                          style: theme.textTheme.titleMedium
                              ?.copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/rating/bx.png",
                        ),
                        Text(
                          "Сапаты - 50%",
                          style: theme.textTheme.titleMedium
                              ?.copyWith(color: AppColors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CertificatePage()));
                  },
                  backgroundColor: AppColors.backgroundColor,
                  color: BorderSide(width: 2, color: AppColors.backgroundColor),
                  minimumSize: Size(166, 56),
                  text: 'Кайталоо',
                ),
                ButtonWidget(
                  onPressed: () {},
                  color: BorderSide(width: 2, color: AppColors.white),
                  minimumSize: Size(166, 56),
                  text: 'Кийинки',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
