import 'package:flutter/material.dart';
import 'package:iqro/config/theme/app.colors.dart';
import 'package:iqro/config/theme/app_texts.dart';
import 'package:iqro/features/auth/presentation/pages/compass/compass_page.dart';
import 'package:iqro/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:iqro/features/auth/presentation/widgets/register/choose_register.dart';
import 'package:iqro/features/auth/presentation/widgets/register/elevated_button_widget.dart';
import 'package:iqro/features/auth/presentation/widgets/register/passtext_field.dart';
import 'package:iqro/features/auth/presentation/widgets/register/textformfield_widget.dart';
import '../../../../../config/helpers/validators.dart';
import '../intro/wellcome.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final textController = TextEditingController();

  bool checkedValue = true;
  bool isCompleted = false;
  bool isValidatePhone = false;
  bool isValidatePassword = false;
  bool isValidateConfirmPassword = false;
  bool isValidateEmail = false;

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();

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
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 29),
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
                    AppTextAuth.register,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                  TextFormFieldWidget(
                    hinText: "Имя",
                    controller: textController,
                    inputType: TextInputType.name,
                    validator: (value) {
                      if (value != null && value == textController.text) {
                        setState(() => isValidateConfirmPassword = false);
                        return null;
                      } else {
                        setState(() => isValidateConfirmPassword = true);
                        return "";
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormFieldWidget(
                    controller: phoneController,
                    hinText: "Номер телефона",
                    inputType: TextInputType.phone,
                    isError: isValidatePhone,
                    validator: (value) {
                      if (isValidPhoneNumber(value!) == null) {
                        setState(() => isValidatePhone = true);
                        return '';
                      } else {
                        setState(() => isValidatePhone = false);
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormFieldWidget(
                    isError: isValidateEmail,
                    validator: (value) {
                      if (isValidPhoneNumber(value!) == null) {
                        setState(() => isValidateEmail = true);
                        return '';
                      } else {
                        setState(() => isValidateEmail = false);
                        return null;
                      }
                    },
                    hinText: "Email адрес",
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  PassTextField(
                    controller: passController,
                    isError: isValidateConfirmPassword,
                    validator: (value) {
                      if (value != null && value.length > 2) {
                        setState(() => isValidatePassword = false);
                        return null;
                      } else {
                        setState(() => isValidatePassword = true);
                        return "";
                      }
                    },
                    hinText: 'Пароль',
                  ),
                  const SizedBox(height: 17),
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // ignore: prefer_const_constructors
                        side: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                          style: BorderStyle.solid,
                        ),
                        visualDensity: const VisualDensity(
                          horizontal: -1,
                          vertical: -1,
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
                      )
                    ],
                  ),
                  const SizedBox(height: 41),
                  ElevatedButtonWidget(
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      print("test");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SignInPage()));
                      // } else {
                      //   null;
                      // }
                    },
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    text: AppTextAuth.enter,
                  ),
                  const SizedBox(height: 49),
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
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ContainerChoose(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => WellcomePage()));
                        },
                        image: 'assets/auth/apple.svg',
                        color: Colors.black,
                      ),
                      ContainerChoose(
                        image: 'assets/auth/Google.svg',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => CompassScreen()));
                        },
                      ),
                      ContainerChoose(
                        onTap: () {
                          // _launchFaceBook();
                        },
                        image: 'assets/auth/Facebook.svg',
                      ),
                    ],
                  ),
                  const SizedBox(height: 56),
                  Column(
                    children: [
                      Text(
                        AppTextAuth.question,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppTextAuth.politic,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // _launchFaceBook() async {
  //   const url = 'https://www.facebook.com';
  //   // ignore: deprecated_member_use
  //   if (await canLaunch(url)) {
  //     // ignore: deprecated_member_use
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  //   // try {
  //   //   // Code to open the URL
  //   // } catch (e) {
  //   //   print('Error launching URL: $e');
  //   //   // Handle the error as needed
  //   // }
  // }
}
