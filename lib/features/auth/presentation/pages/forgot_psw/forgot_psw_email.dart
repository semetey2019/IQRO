import 'package:flutter/material.dart';
import 'package:iqro/config/theme/app.colors.dart';
import 'package:iqro/config/theme/app_texts.dart';
import 'package:iqro/features/auth/presentation/pages/forgot_psw/check_email.dart';
import 'package:iqro/features/auth/presentation/widgets/elevated_button_widget.dart';
import 'package:iqro/features/auth/presentation/widgets/textformfield_widget.dart';

import '../../../../../config/helpers/validators.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  bool checkedValue = true;
  bool isCompleted = false;
  bool isValidateEmail = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 44),
            child: Form(
              key: _formKey,
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
                    AppTextAuth.forgetPsw,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 9),
                  Padding(
                    padding: const EdgeInsets.only(right: 120),
                    child: Text(
                      AppTextAuth.dontWorry,
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Email адрес",
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 6),
                  TextFormFieldWidget(
                    hinText: "Ваш email",
                    validator: (value) {
                      if (isValidPhoneNumber(value!) == null) {
                        setState(() => isValidateEmail = true);
                        return '';
                      } else {
                        setState(() => isValidateEmail = false);
                        return null;
                      }
                    },
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 41),
                  ElevatedButtonWidget(
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    text: AppTextAuth.sendCode2,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CheckEmail()));
                    },
                  ),
                  const SizedBox(height: 170),
                  Center(
                    child: Text(
                      AppTextAuth.haveAcaunt,
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
