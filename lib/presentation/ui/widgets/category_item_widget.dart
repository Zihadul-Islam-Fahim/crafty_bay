import 'package:crafty_bay/data/models/category_model.dart';
import 'package:crafty_bay/presentation/ui/screen/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductListScreen(
          categoryId: category.id?.toInt() ?? 0,
          category: category.categoryName,
        ));
      },
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.network(
                category.categoryImg.toString(),
                height: 70,
                width: 84,
              )),
          Text(
            category?.categoryName ?? 'Electronics',
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
