import 'package:flutter/material.dart';

import '../../../../../config/theme/app.colors.dart';

class WellcomePage extends StatefulWidget {
  WellcomePage({super.key});

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  final List<List<String>> pages = [
    ["assets/auth/books.png", "Текст для первой картинки"],
    ["assets/auth/books.png", "Текст для второй картинки"],
    ["assets/auth/books.png", "Текст для третьей картинки"],
  ];
  int _currentIndex = 0;

  final List<String> images = [
    "assets/auth/books.png",
    "assets/auth/namaz.png",
  ];

  final List<String> texts = [
    "Получите точное время молитв и\n направления на киблу",
    "Вы сможете выбрать другие голоса и параметры азана позже",
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 29),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Добро пожаловать",
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 111),
                Image.asset(
                  images[_currentIndex],
                  height: height * 0.3,
                ),
                const SizedBox(height: 131),
                Text(
                  texts[_currentIndex],
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Переход к следующей странице с картинкой
                      _currentIndex = (_currentIndex + 1) % images.length;
                    });
                  },
                  child: Text(
                    "Включить о местоположения",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(color: Colors.blue),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(235, 227, 235, 249),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < images.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.fiber_manual_record,
                          size: 12,
                          color: i == _currentIndex
                              ? AppColors.backgroundColor
                              : Colors.grey,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
