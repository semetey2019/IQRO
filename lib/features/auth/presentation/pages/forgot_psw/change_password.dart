import 'package:flutter/material.dart';
import 'package:iqro/config/theme/app_texts.dart';
import 'package:iqro/features/auth/presentation/pages/forgot_psw/successfully_page.dart';
import '../../../../../config/theme/app.colors.dart';
import '../../widgets/register/elevated_button_widget.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 28, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/auth/namaz.png',
                    width: width * 0.6,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  AppTextAuth.passChahge,
                  style:
                      theme.textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 11),
                Text(
                  AppTextAuth.cgangeSucses,
                  style:
                      theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 40),
                ElevatedButtonWidget(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  text: AppTextAuth.comePage,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SuccessfullyPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
