import 'package:crafty_bay/presentation/state_holders/review_controller.dart';
import 'package:crafty_bay/presentation/ui/screen/create_review_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/shimmer_effect/shimmer_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  final int productId;

  const ReviewScreen({super.key, required this.productId});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    Get.find<ReviewController>().getReviewList(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateReviewScreen(
                productId: widget.productId,
              ));
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<ReviewController>(
        builder: (controller) {
          if (controller.inProgress) {
            return const ShimmerListView();
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        title: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.person,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              controller.reviewListModel.data![index].profile
                                      ?.cusName ??
                                  '',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 8),
                          child: Text(
                            controller
                                    .reviewListModel.data![index].description ??
                                '',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[500]),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (__, _) {
                    return SizedBox(
                      height: Get.height * 0.01,
                    );
                  },
                  itemCount: controller.reviewListModel.data!.length,
                ),
              ),
              totalPriceAndCheckOutSection(
                  controller.reviewListModel.data?.length ?? 0)
            ],
          );
        },
      ),
    );
  }

  Container totalPriceAndCheckOutSection(int totalReview) {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(26),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Reviews ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black45,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            '($totalReview)',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black45,
              fontFamily: 'Poppins',
            ),
          )
        ],
      ),
    );
  }
}
