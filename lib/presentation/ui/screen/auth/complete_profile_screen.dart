import 'package:crafty_bay/data/models/create_profile_params.dart';
import 'package:crafty_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screen/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _cusNameTEController = TextEditingController();
  final TextEditingController _cusAddTEController = TextEditingController();
  final TextEditingController _cusCityEController = TextEditingController();
  final TextEditingController _cusStateTEController = TextEditingController();
  final TextEditingController _cusPostcodeTEController =
      TextEditingController();
  final TextEditingController _cusCountryTEController = TextEditingController();
  final TextEditingController _cusPhoneTEController = TextEditingController();
  final TextEditingController _cusFaxTEController = TextEditingController();
  final TextEditingController _shipNameTEController = TextEditingController();
  final TextEditingController _shipAddTEController = TextEditingController();
  final TextEditingController _shipCityTEController = TextEditingController();
  final TextEditingController _shipStateTEController = TextEditingController();
  final TextEditingController _shipPostcodeTEController =
      TextEditingController();
  final TextEditingController _shipCountryTEController =
      TextEditingController();
  final TextEditingController _shipPhoneTEController = TextEditingController();
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
                  height: 50,
                ),
                const AppLogo(
                  height: 90,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Complete Profile',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Get started with your details',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _cusNameTEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Address',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _cusAddTEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'City',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _cusCityEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your city';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'State',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _cusStateTEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your state';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Post Code',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _cusPostcodeTEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your post code';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Country',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _cusCountryTEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your country';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Phone',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _cusPhoneTEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your phone';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Fax',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _cusFaxTEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your fax';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Shipping author name',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _shipNameTEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your Shipping author name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Shipping Address',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _shipAddTEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your shipping address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Ship city',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _shipCityTEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your ship city';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Ship state',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _shipStateTEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your ship state';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Ship postcode',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _shipPostcodeTEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your ship postcode';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Ship country',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _shipCountryTEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your ship country';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Ship phone',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  controller: _shipPhoneTEController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your ship phone';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<CompleteProfileController>(builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: controller.inProgress == false,
                      replacement: const CenterCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final createProfileParams = CreateProfileParams(
                                cusAdd: _cusAddTEController.text,
                                cusCity: _cusCityEController.text,
                                cusCountry: _cusCountryTEController.text,
                                cusFax: _cusFaxTEController.text,
                                cusName: _cusNameTEController.text,
                                cusPhone: _cusPhoneTEController.text,
                                cusPostcode: _cusPostcodeTEController.text,
                                cusState: _cusStateTEController.text,
                                shipAdd: _shipAddTEController.text,
                                shipCity: _shipCityTEController.text,
                                shipCountry: _shipCountryTEController.text,
                                shipName: _shipNameTEController.text,
                                shipPhone: _shipPhoneTEController.text,
                                shipPostcode: _shipPostcodeTEController.text,
                                shipState: _shipStateTEController.text);

                            bool result = await controller.completeProfile(
                                Get.find<VerifyOtpController>().token,
                                createProfileParams);
                            if (result) {
                              Get.offAll(() => const MainBottomNavScreen());
                            } else {
                              Get.showSnackbar(
                                GetSnackBar(
                                  title: 'Profile Complete Failed !!',
                                  message: controller.msg,
                                  backgroundColor: Colors.red,
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text(
                          'Complete',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cusAddTEController.dispose();
    _cusCityEController.dispose();
    _cusCountryTEController.dispose();
    _cusFaxTEController.dispose();
    _cusNameTEController.dispose();
    _cusPhoneTEController.dispose();
    _cusPostcodeTEController.dispose();
    _cusStateTEController.dispose();
    _shipAddTEController.dispose();
    _shipCityTEController.dispose();
    _shipCountryTEController.dispose();
    _shipNameTEController.dispose();
    _shipPhoneTEController.dispose();
    _shipPostcodeTEController.dispose();
    _shipStateTEController.dispose();
    super.dispose();
  }
}
