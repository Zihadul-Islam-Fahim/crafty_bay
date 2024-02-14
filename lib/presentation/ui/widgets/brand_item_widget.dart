import 'package:crafty_bay/data/models/brand_model.dart';
import 'package:crafty_bay/presentation/ui/screen/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandItem extends StatelessWidget {
  final BrandModel brand;

  const BrandItem({
    super.key,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          ProductListScreen(
            category: brand.brandName,
            brandId: brand.id!.toInt(),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.network(
                brand.brandImg.toString(),
                height: 70,
                width: 84,
              )),
          Text(
            brand?.brandName ?? 'Electronics',
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
