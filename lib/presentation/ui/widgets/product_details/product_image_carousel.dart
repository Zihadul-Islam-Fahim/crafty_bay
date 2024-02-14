import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ProductImageCarouselWidget extends StatefulWidget {
  final double height;
  final List<String> urls;

  const ProductImageCarouselWidget({
    super.key,
    required this.height,
    required this.urls,
  });

  @override
  State<ProductImageCarouselWidget> createState() =>
      _ProductImageCarouselWidgetState();
}

class _ProductImageCarouselWidgetState
    extends State<ProductImageCarouselWidget> {
  ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              currentIndex.value = index;
            },
            height: widget.height ?? 180,
            viewportFraction: 1,
            autoPlay: true,
          ),
          items: widget.urls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                          image: NetworkImage(url), fit: BoxFit.cover)),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 4,
        ),
        Positioned(
          bottom: 5,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: currentIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.urls.length; i++)
                    Container(
                      height: 14,
                      width: 14,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color:
                            i == index ? AppColors.primaryColor : Colors.white,
                        border: Border.all(
                          color:
                              i == index ? AppColors.primaryColor : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
