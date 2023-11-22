import 'package:flutter/material.dart';
import 'package:iqro/features/auth/presentation/pages/forgot_psw/change_password.dart';
import 'package:iqro/features/auth/presentation/pages/forgot_psw/forgot_psw.dart';
import 'package:iqro/features/auth/presentation/widgets/passtext_field.dart';
import '../../../../../config/helpers/validators.dart';
import '../../../../../config/theme/app.colors.dart';
import '../../../../../config/theme/app_texts.dart';
import '../../widgets/elevated_button_widget.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final passController1 = TextEditingController();
  bool isValidatePassword = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 28, 44),
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
                    AppTextAuth.sbros,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 11),
                  Text(
                    AppTextAuth.write,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    AppTextAuth.newPass,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 6),
                  PassTextField(
                    controller: passController,
                    hinText: "Должно быть 8 символов",
                    validator: (value) {
                      if (isValidPhoneNumber(value!) == null) {
                        setState(() => isValidatePassword = true);
                        return '';
                      } else {
                        setState(() => isValidatePassword = false);
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Подтвердите новый пароль",
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 6),
                  PassTextField(
                    validator: (value) {
                      if (isValidPhoneNumber(value!) == null) {
                        setState(() => isValidatePassword = true);
                        return '';
                      } else {
                        setState(() => isValidatePassword = false);
                        return null;
                      }
                    },
                    hinText: "Повторите пароль",
                    controller: passController1,
                  ),
                  const SizedBox(height: 38),
                  ElevatedButtonWidget(
                    text: AppTextAuth.sbros,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ChangePassword()));
                    },
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 114),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ForgotPswNumber()));
                      },
                      child: Text(
                        AppTextAuth.haveAcaunt,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
