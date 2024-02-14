import 'package:crafty_bay/presentation/ui/widgets/shimmer_effect/carousel_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SimmerProductDetails extends StatelessWidget {
  SimmerProductDetails({super.key});

  List<String> productColors = ['s', 's', 's', 's', 's'];

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerBannerCarousel(
            height: Get.height * 0.3,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: Get.height * 0.03,
            color: Colors.grey[300]!,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: Get.height * 0.03,
            width: Get.width * 0.4,
            color: Colors.grey[300]!,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: Get.height * 0.02,
            width: Get.width * 0.1,
            color: Colors.grey[300]!,
          ),
          Row(
            children: productColors
                .map(
                  (c) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300]!,
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: Get.height * 0.02,
            width: Get.width * 0.1,
            color: Colors.grey[300]!,
          ),
          Row(
            children: productColors
                .map(
                  (c) => Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[300]!),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: Get.height * 0.02,
            width: Get.width * 0.3,
            color: Colors.grey[300]!,
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            height: Get.height * 0.15,
            color: Colors.grey[300]!,
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
            height: Get.height * 0.10,
            color: Colors.grey[300]!,
          ),
        ],
      ),
    );
  }
}
