import 'package:crafty_bay/presentation/state_holders/review_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  final int productId;

  const CreateReviewScreen({super.key, required this.productId});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _reviewDesTEController = TextEditingController();
  final TextEditingController _ratingDesTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
        leadingWidth: 20,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Write Review',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              controller: _reviewDesTEController,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'enter review';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              textInputAction: TextInputAction.done,
              maxLines: 1,
              decoration: const InputDecoration(
                hintText: 'Rating out of 5',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              controller: _ratingDesTEController,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'enter rating';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: Get.width * 0.7,
              height: 45,
              child: GetBuilder<ReviewController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress == false,
                    replacement: const CenterCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () async {
                        final result = await controller.createReview(
                          _ratingDesTEController.text.trim(),
                          _reviewDesTEController.text.trim(),
                          widget.productId.toString(),
                        );
                        if (result) {
                          Get.back();
                          controller.getReviewList(widget.productId);
                        } else {
                          Get.snackbar('Failed', 'Please Log in');
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
