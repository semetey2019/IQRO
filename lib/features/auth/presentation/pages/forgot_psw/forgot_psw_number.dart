import 'package:flutter/material.dart';
import 'package:iqro/features/auth/presentation/pages/forgot_psw/enter_code.dart';
import '../../../../../config/helpers/validators.dart';
import '../../../../../config/theme/app.colors.dart';
import '../../../../../config/theme/app_texts.dart';
import '../../widgets/register/elevated_button_widget.dart';
import '../../widgets/register/textformfield_widget.dart';

class ForgotPswNumber extends StatefulWidget {
  const ForgotPswNumber({super.key});

  @override
  State<ForgotPswNumber> createState() => _ForgotPswNumberState();
}

class _ForgotPswNumberState extends State<ForgotPswNumber> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  bool isValidatePhone = false;
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
                      AppTextAuth.dontWorry2,
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    AppTextAuth.phoneNumber,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.white),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 6),
                  TextFormFieldWidget(
                    hinText: "Ваш номер телефона",
                    validator: (value) {
                      if (isValidPhoneNumber(value!) == null) {
                        setState(() => isValidatePhone = true);
                        return '';
                      } else {
                        setState(() => isValidatePhone = false);
                        return null;
                      }
                    },
                    controller: phoneController,
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(height: 41),
                  ElevatedButtonWidget(
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    text: AppTextAuth.sendCode2,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const EnterCode()));
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
