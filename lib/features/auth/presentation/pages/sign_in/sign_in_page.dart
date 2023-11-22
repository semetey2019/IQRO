import 'package:flutter/material.dart';
import 'package:iqro/config/theme/app.colors.dart';
import 'package:iqro/config/theme/app_texts.dart';
import 'package:iqro/features/auth/presentation/pages/forgot_psw/forgot_psw_email.dart';
import 'package:iqro/features/auth/presentation/widgets/choose_register.dart';
import 'package:iqro/features/auth/presentation/widgets/elevated_button_widget.dart';
import 'package:iqro/features/auth/presentation/widgets/textformfield_widget.dart';
import '../../../../../config/helpers/validators.dart';
import '../../widgets/passtext_field.dart';
import '../intro/notification_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

bool checkedValue = true;

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  bool isCompleted = false;
  bool isValidatePhone = false;
  bool isValidatePassword = false;
  bool isValidateConfirmPassword = false;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 27),
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
                    AppTextAuth.enter,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                  TextFormFieldWidget(
                    validator: (value) {
                      if (isValidPhoneNumber(value!) == null) {
                        setState(() => isValidatePhone = true);
                        return '';
                      } else {
                        setState(() => isValidatePhone = false);
                        return null;
                      }
                    },
                    controller: emailController,
                    inputType: TextInputType.number,
                    hinText: "Email адрес",
                  ),
                  const SizedBox(height: 10),
                  PassTextField(
                    validator: (value) {
                      if (isValidPhoneNumber(value!) == null) {
                        setState(() => isValidatePhone = true);
                        return '';
                      } else {
                        setState(() => isValidatePhone = false);
                        return null;
                      }
                    },
                    hinText: 'Пароль',
                  ),
                  const SizedBox(height: 19),
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Закругленные углы
                        ),
                        // ignore: prefer_const_constructors
                        side: BorderSide(
                          color: Colors.white, // Цвет границы
                          width: 2.0, // Ширина границы
                          style: BorderStyle.solid, // Стиль границы
                        ),
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                        value: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue!;
                          });
                        },
                      ),
                      Text(
                        "Запомнить меня",
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(width: 103),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ForgotPassword()));
                        },
                        child: Text(
                          "Забыли пароль?",
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 41),
                  ElevatedButtonWidget(
                    text: AppTextAuth.enter,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => NotificationPage()));
                    },
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.3,
                        height: height * 0.001,
                        decoration: const BoxDecoration(color: AppColors.line),
                      ),
                      const SizedBox(width: 33),
                      Text(
                        "или",
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(width: 33),
                      Container(
                        width: width * 0.3,
                        height: height * 0.001,
                        decoration: const BoxDecoration(color: AppColors.line),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                  const SizedBox(height: 39),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ContainerChoose(
                        image: 'assets/auth/apple.svg',
                      ),
                      ContainerChoose(
                        image: 'assets/auth/Google.svg',
                      ),
                      ContainerChoose(
                        image: 'assets/auth/Facebook.svg',
                        color: null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 56),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'У вас уже есть аккаунт? Авторизоваться',
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
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
