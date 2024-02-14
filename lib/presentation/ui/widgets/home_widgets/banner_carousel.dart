import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/data/models/banner_model.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class BannerCarouselWidget extends StatefulWidget {
  final double height;
  final List<BannerItem> bannerList;

  const BannerCarouselWidget({
    required this.bannerList,
    super.key,
    required this.height,
  });

  @override
  State<BannerCarouselWidget> createState() => _BannerCarouselWidgetState();
}

class _BannerCarouselWidgetState extends State<BannerCarouselWidget> {
  ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          items: widget.bannerList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Container(
                      width: Get.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        i?.image ?? '',
                        fit: BoxFit.fitHeight,
                        height: widget.height,
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * 0.5,
                              child: Text(
                                i?.title ?? '',
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: Get.width * 0.4,
                              child: Text(
                                i?.shortDes ?? '',
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 4,
        ),
        ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.bannerList.length; i++)
                  Container(
                    height: 14,
                    width: 14,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: i == index ? AppColors.primaryColor : Colors.white,
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
        )
      ],
    );
  }
}
