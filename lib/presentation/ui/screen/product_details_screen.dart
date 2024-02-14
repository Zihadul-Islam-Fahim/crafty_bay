import 'package:crafty_bay/data/models/product_details_data.dart';
import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/screen/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/color_selector.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_image_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/review_and_rating.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/size_selector.dart';
import 'package:crafty_bay/presentation/ui/widgets/shimmer_effect/shimmer_product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ValueNotifier<int> noOfCartItem = ValueNotifier(1);

  String? _selectedColor;

  String? _selectedSize;

  @override
  void initState() {
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        leadingWidth: 20,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsController>(builder: (controller) {
        if (controller.inProgress) {
          return SimmerProductDetails();
        } else if (controller.productDetailsModel.data!.isEmpty) {
          return const Center(
            child: Text('Didn\'t get data'),
          );
        }
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImageCarouselWidget(height: Get.height * 0.3, urls: [
                      controller.productDetailsData.img1 ?? '',
                      controller.productDetailsData.img2 ?? '',
                      controller.productDetailsData.img3 ?? '',
                      controller.productDetailsData.img4 ?? '',
                    ]),
                    productDetailsBody(controller.productDetailsData),
                  ],
                ),
              ),
            ),
            priceAndCartSection(
                controller.productDetailsData.product?.price ?? '0'),
          ],
        );
      }),
    );
  }

  Padding productDetailsBody(ProductDetailsDataModel productDetails) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productDetails.product?.title ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: noOfCartItem,
                builder: (context, value, _) {
                  return ItemCount(
                    initialValue: value,
                    minValue: 1,
                    maxValue: 10,
                    step: 1,
                    color: AppColors.primaryColor,
                    buttonSizeHeight: 30,
                    buttonSizeWidth: 40,
                    textStyle: const TextStyle( fontFamily: 'Poppins',),
                    onChanged: (v) {
                      noOfCartItem.value = v.toInt();
                    },
                    decimalPlaces: 0,
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: Get.height * 0.015,
          ),
          reviewAndRatingRow(productDetails.product?.star?.toDouble() ?? 0,
              productDetails.productId?.toInt() ?? 1),
          SizedBox(
            height: Get.height * 0.01,
          ),
          const Text(
            'Color',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          ColorSelector(
            productColors: productDetails.color
                    ?.split(',')
                    .map((e) => getColorFromString(e))
                    .toList() ??
                [],
            onChange: (selectedColor) {
              _selectedColor = selectedColor.toString();
            },
          ),
          SizedBox(
            height: Get.height * 0.015,
          ),
          const Text(
            'Size',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          SizeSelector(
              sizes: productDetails.size?.split(',') ?? [],
              onChange: (s) {
                _selectedSize = s;
              }),
          SizedBox(
            height: Get.height * 0.015,
          ),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(
            productDetails.des!,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontFamily: 'Poppins',
            ),
          )
        ],
      ),
    );
  }

  Container priceAndCartSection(String price) {
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
                'Price',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: Colors.black45,
                ),
              ),
              Text(
                price.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          SizedBox(
            width: Get.width * 0.29,
            child: GetBuilder<AddToCartController>(builder: (controller) {
              return Visibility(
                visible: controller.inProgress == false,
                replacement: const CenterCircularProgressIndicator(),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_selectedColor != null && _selectedSize != null) {
                      if (Get.find<AuthController>().isTokenNotNull) {
                        final bool response = await controller.addToCart(
                            widget.productId,
                            colorToString(_selectedColor!),
                            _selectedSize!,
                            noOfCartItem.value);
                        if (response) {
                          Get.snackbar(
                              "Success", "This product has been added to Cart",
                              backgroundColor: AppColors.primaryColor,
                              duration: const Duration(seconds: 2));
                        } else {
                          Get.snackbar("Failed", controller.msg,
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 2));
                        }
                      } else {
                        Get.to(() => const VerifyEmailScreen());
                      }
                    } else {
                      Get.snackbar(
                          'Add to Cart Failed', "Please Select color and size",
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 2));
                    }
                  },
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Color getColorFromString(String colorCode) {
    String code = colorCode.toLowerCase();
    if (code == 'red') {
      return Colors.red;
    }
    if (code == 'black') {
      return Colors.black;
    }
    if (code == 'green') {
      return Colors.green;
    }
    if (code == 'blue') {
      return Colors.blue;
    } else {
      return Colors.white;
    }
  }

  String colorToString(String colorCode) {
    String code = colorCode;
    if (code == 'MaterialColor(primary value: Color(0xff4caf50))') {
      return 'Green';
    }
    if (code == 'MaterialColor(primary value: Color(0xfff44336))') {
      return 'Red';
    } else {
      return 'White';
    }
  }
}
