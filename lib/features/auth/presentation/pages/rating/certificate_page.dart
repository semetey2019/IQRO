import 'package:flutter/material.dart';

import '../../../../../config/theme/app.colors.dart';
import '../../widgets/rating/button_widget.dart';
import '../../widgets/rating/weeks_widget.dart';

class CertificatePage extends StatefulWidget {
  const CertificatePage({super.key});

  @override
  State<CertificatePage> createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
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
                "assets/rating/certificate.png",
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
                      "Жуманын жарымы сабактарды \nкалтыруусуз аткарылды!",
                      style: theme.textTheme.titleMedium
                          ?.copyWith(color: AppColors.backgroundColor),
                      textAlign: TextAlign.center,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeeksWidget(text: 'Дш'),
                        WeeksWidget(text: 'Шм'),
                        WeeksWidget(text: 'Шр'),
                        WeeksWidget(text: 'Бш'),
                        WeeksWidget(text: 'Жм', blendMode: BlendMode.colorBurn),
                        WeeksWidget(text: 'Иш', blendMode: BlendMode.colorBurn),
                        WeeksWidget(text: 'Жк', blendMode: BlendMode.colorBurn),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            ButtonWidget(
              backgroundColor: AppColors.white,
              onPressed: () {},
              // ignore: prefer_const_constructors
              color: BorderSide(width: 2, color: AppColors.backgroundColor),
              minimumSize: const Size(double.infinity, 56),
              text: "Кийинки",
            ),
            //Кийинки дегендин тусун озгортуу калды. Экстракт виджеттен караш керек
          ],
        ),
      ),
    );
  }
}
