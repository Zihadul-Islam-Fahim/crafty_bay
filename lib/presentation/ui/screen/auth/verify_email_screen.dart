import 'package:crafty_bay/presentation/state_holders/send_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'verify_otp_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 160,
                ),
                const AppLogo(
                  height: 90,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Please enter your email address',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  validator: (value) {
                    RegExp emailRegex =
                        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                    bool isValidEmail = emailRegex.hasMatch(value!);
                    if (value.trim().isEmpty ?? true) {
                      return 'Enter your Email';
                    } else if (isValidEmail == false) {
                      return 'Enter an valid email';
                    }
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<SendOtpController>(
                  builder: (controller) {
                    return SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: controller.inProgress == false,
                        replacement: const CenterCircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              bool result = await controller
                                  .sendOtp(_emailController.text.trim());
                              if (result == true) {
                                Get.to(() => VerifyOTPScreen(
                                      email: _emailController.text.trim(),
                                    ));
                              } else {
                                Get.snackbar(
                                  'Failed',
                                  controller.message,
                                  backgroundColor: Colors.red,
                                  duration: const Duration(seconds: 2),
                                );
                              }
                            }
                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    );
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
