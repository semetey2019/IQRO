import 'package:flutter/material.dart';
import 'package:iqro/config/theme/app_texts.dart';
import '../../../../../config/theme/app.colors.dart';
import '../../widgets/elevated_button_widget.dart';

class SuccessfullyPage extends StatelessWidget {
  const SuccessfullyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 11),
            child: Row(
              children: [
                Image.asset("assets/auth/bell.png"),
                const SizedBox(
                  width: 14,
                ),
                Image.asset("assets/auth/settings.png"),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
            child: Container(
              width: double.infinity,
              height: height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.backgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppTextAuth.islam,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.white, height: 0),
                  ),
                  Image.asset("assets/auth/books.png", height: height * 0.1),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          Text("БИШКЕК",
              style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.backgroundColor)),
          Text(
            "12:00",
            style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w900, color: AppColors.backgroundColor),
          ),
          Container(
            height: height * 0.5,
            width: width * 0.6,
            decoration: const BoxDecoration(
                color: Color.fromARGB(31, 61, 114, 120),
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(15), right: Radius.circular(15))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 40, top: 20, bottom: 0),
                      child: Column(
                        children: [
                          Image.asset("assets/auth/Icons.png"),
                          const SizedBox(height: 25),
                          const Text(AppTextAuth.regSucses,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 15),
                          const Text(AppTextAuth.wellcome2,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 25),
                          const Text(
                            AppTextAuth.text2,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 13),
                          ),
                          const Text(AppTextAuth.text3,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 15),
                          ElevatedButtonWidget(
                            onPressed: () {},
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            text: AppTextAuth.prodoljit,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
