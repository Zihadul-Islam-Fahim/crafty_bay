import 'package:crafty_bay/presentation/state_holders/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/wishlist_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/shimmer_effect/shimmer_product_list_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<WishlistController>().getWishList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Get.find<BottomNavController>().changeIndex(0);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 20,
          leading: IconButton(
              onPressed: () {
                Get.find<BottomNavController>().changeIndex(0);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              )),
          title: const Text(
            'Wishlist',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<WishlistController>(builder: (controller) {
            if (controller.inProgress) {
              return const ShimmerProductListGridView();
            }
            return GridView.builder(
              itemCount: controller.wishlistProductModel.data?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.80,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  productModel:
                      controller.wishlistProductModel.data![index].product!,
                  isWishProduct: true,
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
