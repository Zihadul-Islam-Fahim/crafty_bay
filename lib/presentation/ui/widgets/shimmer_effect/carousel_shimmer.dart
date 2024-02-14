import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBannerCarousel extends StatelessWidget {
  const ShimmerBannerCarousel({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ShimmerBannerCarouselWidget(
        height: height,
      ),
    );
  }
}

class ShimmerBannerCarouselWidget extends StatefulWidget {
  final double height;

  const ShimmerBannerCarouselWidget({
    super.key,
    required this.height,
  });

  @override
  _ShimmerBannerCarouselWidgetState createState() =>
      _ShimmerBannerCarouselWidgetState();
}

class _ShimmerBannerCarouselWidgetState
    extends State<ShimmerBannerCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: widget.height,
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey[300]!,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    flex: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Get.width * 0.8,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 4; i++)
              Container(
                height: 14,
                width: 14,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey[300]!,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              )
          ],
        )
      ],
    );
  }
}
