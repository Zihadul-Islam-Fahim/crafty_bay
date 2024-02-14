import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/state_holders/wishlist_controller.dart';
import 'package:crafty_bay/presentation/ui/screen/product_details_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  bool? isWishProduct;

  ProductCard({super.key, required this.productModel, this.isWishProduct});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => ProductDetailScreen(
            productId: productModel.id!.toInt(),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: Get.height * 0.60,
        width: 160,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: AspectRatio(
                  aspectRatio: 12 / 9,
                  child: Image.network(
                    productModel.image ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${productModel.price ?? ''}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.01,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.amber,
                            ),
                            Text(
                              productModel.star.toString() ?? "0",
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.black45,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: Get.width * 0.017,
                        ),
                        Card(
                          color: AppColors.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: isWishProduct == true
                                ? InkWell(
                                    onTap: () async {
                                      await Get.find<WishlistController>()
                                          .deleteFromWishList(
                                              productModel.id!.toInt());
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      size: 13,
                                      color: Colors.white,
                                    ),
                                  )
                                : InkWell(
                                    onTap: () async {
                                      bool result =
                                          await Get.find<WishlistController>()
                                              .addToWishList(
                                                  productModel.id!.toInt());
                                      if (result) {
                                        Get.snackbar('Success',
                                            'Item added to wishlist.',
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            colorText: Colors.white);
                                      } else {
                                        Get.snackbar(
                                            'Failed', ' Log in log in first.',
                                            backgroundColor: Colors.red,
                                            colorText: Colors.white);
                                      }
                                    },
                                    child: const Icon(
                                      Icons.favorite_border_outlined,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
