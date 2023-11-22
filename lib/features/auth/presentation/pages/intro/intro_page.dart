import 'package:flutter/material.dart';
import 'package:iqro/config/theme/app.colors.dart';
import 'package:iqro/config/theme/app_texts.dart';
import 'package:iqro/features/auth/presentation/pages/register/register_page.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int currentPageIndex = 0; // Индекс текущей страницы с картинками
  final List<String> images = [
    "assets/auth/namaz.png",
    "assets/auth/dua.png",
    "assets/auth/books.png",
  ];
  final List<String> texts = [
    AppTextAuth.enterText,
    AppTextAuth.enter,
    AppTextAuth.forgetPsw,
  ];
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const RegisterPage()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(54, 100, 54, 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                images[currentPageIndex],
                height: height * 0.3,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < images.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.fiber_manual_record,
                        size: 15,
                        color: i == currentPageIndex
                            ? AppColors.backgroundColor
                            : Colors.grey,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 30),
              Text(AppTextAuth.wellcome,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: AppColors.backgroundColor)),
              const SizedBox(height: 22),
              Text(
                texts[currentPageIndex],
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 147),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.backgroundColor,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      // Переход к следующей странице с картинкой
                      currentPageIndex = (currentPageIndex + 1) % images.length;
                    });
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (_) => SignInPage()));
                  },
                  child: Text(
                    AppTextAuth.next,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
