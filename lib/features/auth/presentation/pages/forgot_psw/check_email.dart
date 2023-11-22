import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iqro/config/theme/app_texts.dart';
import 'package:iqro/features/auth/presentation/pages/forgot_psw/reset_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../config/theme/app.colors.dart';
import '../../widgets/elevated_button_widget.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({super.key});

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  final _formKey = GlobalKey<FormState>();
  final pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextEditingController pinController = TextEditingController();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 28, 0),
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
                    AppTextAuth.please,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    AppTextAuth.sendCode,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                  PinCodeTextField(
                    textStyle: const TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                    length: 4,
                    controller: pinController,
                    appContext: context,
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(milliseconds: 300),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(15),
                      fieldWidth: width * 0.18,
                      fieldHeight: height * 0.1,
                      inactiveFillColor: AppColors.backgroundColor,
                      selectedColor: Colors.white,
                      inactiveColor: Colors.white,
                      activeFillColor: AppColors.backgroundColor,
                      activeColor: Colors.grey[300],
                      borderWidth: 1,
                    ),
                    validator: (v) {
                      return v!.length < 4 ? 'invalid password' : null;
                    },
                    onChanged: (String value) {},
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButtonWidget(
                    text: AppTextAuth.podtverdit,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ResetPassword()));
                      } else {
                        null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppTextAuth.againSend,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "00:20",
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.white),
                      )
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
