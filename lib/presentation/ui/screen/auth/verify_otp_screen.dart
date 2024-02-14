import 'package:crafty_bay/presentation/state_holders/send_otp_controller.dart';
import 'package:crafty_bay/presentation/state_holders/time_decrease_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screen/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'complete_profile_screen.dart';

class VerifyOTPScreen extends StatefulWidget {
  final String email;

  const VerifyOTPScreen({super.key, required this.email});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final TextEditingController otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TimeDecreaseController _timeDecreaseController =
      Get.find<TimeDecreaseController>();

  @override
  void initState() {
    _timeDecreaseController.decreaseSeconds(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: GetBuilder<TimeDecreaseController>(
            builder: (TimeDecreaseController controller) {
              return Form(
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
                      'Enter OTP Code',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'A 4 digit OTP code has been sent',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeFillColor: Colors.white,
                          inactiveColor: AppColors.primaryColor,
                          inactiveFillColor: Colors.transparent,
                          selectedFillColor: Colors.transparent,
                          selectedColor: Colors.purple),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      appContext: context,
                      controller: otpTEController,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GetBuilder<VerifyOtpController>(builder: (controller) {
                      return SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: controller.inProgress == false,
                          replacement: const CenterCircularProgressIndicator(),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final bool response =
                                    await controller.verifyOTP(
                                        widget.email, otpTEController.text);
                                if (response) {
                                  if (controller
                                      .shouldNavigateCompleteProfile) {
                                    Get.to(
                                        () => const CompleteProfileScreen());
                                  } else {
                                    Get.offAll(
                                        () => const MainBottomNavScreen());
                                  }
                                } else {
                                  Get.showSnackbar(
                                    GetSnackBar(
                                      title: 'OTP Verification Failed!',
                                      message: controller.msg,
                                      backgroundColor: Colors.red,
                                      // duration: const Duration(seconds: 2),
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          const TextSpan(
                            text: 'This code will expire in ',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                          ),
                          TextSpan(
                            text: '${controller.currentSeconds} s',
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      onPressed: () async {
                        if (controller.timeOver == true) {
                          final result = await Get.find<SendOtpController>()
                              .sendOtp(widget.email);
                          if (result) {
                            Get.snackbar('OTP Resend',
                                'OTP resend to your email address');
                          } else {
                            Get.snackbar('Failed', 'OTP Resend Failed',
                                backgroundColor: Colors.red);
                          }
                        }
                      },
                      child: const Text(
                        'Resend Code',
                        style: TextStyle(
                            color: Colors.grey, fontFamily: 'Poppins'),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
