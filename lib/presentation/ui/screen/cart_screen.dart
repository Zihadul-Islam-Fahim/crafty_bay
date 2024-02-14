import 'package:crafty_bay/presentation/state_holders/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screen/checkout_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/cart_widgets/cart_items.dart';
import 'package:crafty_bay/presentation/ui/widgets/shimmer_effect/shimmer_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartListController>().getCartList();
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
          title: const Text(
            'Cart Screen',
            style: TextStyle(
              color: Colors.grey,
              fontFamily: 'Poppins',
            ),
          ),
          leadingWidth: 20,
          leading: IconButton(
            onPressed: () {
              Get.find<BottomNavController>().changeIndex(0);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          ),
        ),
        body: GetBuilder<CartListController>(builder: (controller) {
          if (controller.inProgress) {
            return const ShimmerListView();
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        controller.cartListModel.cartItemList?.length ?? 0,
                    itemBuilder: (context, index) => CartProductItem(
                      cartItem: controller.cartListModel.cartItemList![index],
                    ),
                  ),
                ),
                totalPriceAndCheckOutSection(controller.totalPrice)
              ],
            );
          }
        }),
      ),
    );
  }

  Container totalPriceAndCheckOutSection(RxDouble totalPrice) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Price',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45,
                  fontFamily: 'Poppins',
                ),
              ),
              Obx(
                () => Text(
                  '৳$totalPrice',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                    fontFamily: 'Poppins',
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: Get.width * 0.25,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const CheckoutScreen());
              },
              child: const Text(
                'Check out',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
