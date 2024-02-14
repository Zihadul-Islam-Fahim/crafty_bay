import 'package:crafty_bay/presentation/state_holders/wishlist_controller.dart';
import 'package:crafty_bay/presentation/ui/screen/review_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Row reviewAndRatingRow(double rating, int productId) {
  return Row(
    children: [
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Icon(
            Icons.star,
            size: 19,
            color: Colors.amber,
          ),
          Text(
            rating.toString(),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black45,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          )
        ],
      ),
      SizedBox(
        width: Get.width * 0.02,
      ),
      GestureDetector(
        onTap: () {
          Get.to(() => ReviewScreen(
                productId: productId,
              ));
        },
        child: const Text(
          'Reviews',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.7,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      InkWell(
        onTap: () async {
          final bool result =
              await Get.find<WishlistController>().addToWishList(productId);
          if (result) {
            Get.snackbar('Success', 'Item added to wishlist.',
                backgroundColor: AppColors.primaryColor);
          } else {
            Get.snackbar('Failed', ' Log in log in first.',
                backgroundColor: Colors.red, colorText: Colors.white);
          }
        },
        child: const Card(
          color: AppColors.primaryColor,
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 14,
              color: Colors.white,
            ),
          ),
        ),
      )
    ],
  );
}
